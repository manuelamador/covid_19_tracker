module CovidTracker 

using DataFrames: names, mapcols, DataFrame!, stack, ByRow, select!
using TimeSeries: moving, lead, TimeArray
using Dates: Dates, Day, Month, Year, Date, now, monthabbr
using Statistics: mean
using Plots, Plots.Measures
import JSON
import HTTP
import CSV

export download_covid_data, plot_country_pc_daily, plot_state_pc_daily, plot_county_pc_daily, list_countries

const PATH_DATA =  joinpath(dirname(@__FILE__), "..", "data")

const _DATE_STR = r"^\d{1,2}\/\d{1,2}\/\d{2}$"

## John Hopkins database
const url_header = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/"


mutable struct Data 
    iso::Dict{String, String}
    pop::Dict{String, Union{Nothing,Int64}}
end 

DATA  = Data(Dict{String, String}(), Dict{String, Union{Nothing,Int64}}())

_WB_ISO2_CODES = Dict(
    "Korea, South" => "KR",
    "US" => "US"
)


list_countries(df) = sort(collect(Set(df["global_confirmed"][!, "Country/Region"])))


function download_covid_data()
    df = (
      global_confirmed = DataFrame!(CSV.File(HTTP.get(url_header * "time_series_covid19_confirmed_global.csv").body)),
      global_deaths = DataFrame!(CSV.File(HTTP.get(url_header * "time_series_covid19_deaths_global.csv").body)),
      us_deaths = DataFrame!(CSV.File(HTTP.get(url_header * "time_series_covid19_deaths_US.csv").body)),
      us_confirmed = DataFrame!(CSV.File(HTTP.get(url_header * "time_series_covid19_confirmed_US.csv").body))
    )
    return df
end


function update_pop_file()
    @info "Updating Population data"
    url = "http://api.worldbank.org/v2/countries/all/indicator/SP.POP.TOTL?date=2019&per_page=25000&format=json"
    request = HTTP.get(url)
    open(joinpath(PATH_DATA, "pop.json"), write=true) do f
        write(f, String(request.body))
    end
end 


function read_pop(;dat=DATA)
    !isfile(joinpath(PATH_DATA, "pop.json")) && update_pop_file()
    body = open(joinpath(PATH_DATA, "pop.json")) do f
        read(f, String)
    end
    out = JSON.parse(body)[2]
    dat.pop = Dict(x["country"]["id"] => x["value"] for x in out) 
end


function get_pop(code_iso2; dat=DATA)
    isempty(dat.pop) && read_pop(dat=dat)
    ## getting country's population from the worldbank
    return dat.pop[code_iso2]
end 


function update_iso2_file()
    @info "Updating ISO2 data"
    url = "http://api.worldbank.org/v2/countries/all?per_page=25000&format=json"
    request = HTTP.get(url)
    open(joinpath(PATH_DATA, "iso2.json"), write=true) do f
        write(f, String(request.body))
    end
end 


function read_iso2(;dat=DATA)
    !isfile(joinpath(PATH_DATA, "iso2.json")) && update_iso2_file()
    body = open(joinpath(PATH_DATA, "iso2.json")) do f
        read(f, String)
    end
    out = JSON.parse(body)[2]
    dat.iso = Dict(x["name"] => x["iso2Code"] for x in out)
end


function get_iso2(str; dat=DATA)
    isempty(dat.iso) && read_iso2(dat=dat)
    matches = [(v, k) for (k, v) in dat.iso if occursin(str, k)]
    if length(matches) == 1
        return matches[1][1]
    elseif isempty(matches)
        @error "No country names matches " * str
    else 
        @warn string(length(matches)) * " countries match " * str
        @warn matches
    end 
end


function to_TimeArray(df; init_date=Date(2020, 3, 1))
    return stack(df, names(df), variable_name=:date, variable_eltype=String) |>  ## transpose the dataset -- make columns (dates) into rows
        x -> select!(x, :date => ByRow(x -> Date(x, "mm/dd/yy") + Dates.Year(2000)) => :date, :value) |>  ## convert and fix the dates
        x -> TimeArray(x, timestamp=:date) |> ## convert to time array
        x -> x[init_date:Day(1):Date(2030,1,1)] ## select after March 2020
end 


function get_counties(f, series, df)
    return filter(f, df[series]) |> ## select county
    x -> x[!, _DATE_STR] |> ## only column dates
    x -> mapcols(sum ∘ skipmissing, x) |> ## aggregate across columns (dates) -- should not be necessary by county
    x -> to_TimeArray(x)
end 

get_counties_pop(f,  df) = filter(f, df[:us_deaths])[!, :Population] |> sum ∘ skipmissing 

get_county(county, state, series, df) =  get_counties(x-> (x["Province_State"] === state) & (x["Admin2"] === county), series, df)

get_state(state, series, df) = get_counties(x-> (x["Province_State"] === state), series, df)

function get_county_pc(county, state, series, df)
    f = x -> (x["Province_State"] === state) & (x["Admin2"] === county)
    return get_counties(f, series, df) ./ get_counties_pop(f, df) .* 1_000_000.0
end 


function get_state_pc(state, series, df)
    f = x -> (x["Province_State"] === state) 
    return get_counties(f, series, df) ./ get_counties_pop(f, df) .* 1_000_000.0
end 


function get_country(country, series, df)
    return filtered = filter(x-> x["Country/Region"] === country, df[series]) |> ## select country
        x -> x[!, _DATE_STR] |> ## only columns names that are dates
        x -> mapcols(sum ∘ skipmissing, x) |> ## aggregate across all columns (dates)
        x -> to_TimeArray(x) 
end 


function get_country_pc(country, series, df)
    iso2 = country in keys(_WB_ISO2_CODES) ? _WB_ISO2_CODES[country] : get_iso2(country)
    pop = get_pop(iso2) 
    ta = get_country(country, series, df)  ./ pop .* 1_000_000.0
    return ta
end


my_diff(ts) = max.(diff(ts), 0) ## take first differences and drop negative obs


# Plotting 

function plot_helper(ta)
    fig = plot(ta, ribbon=(0.0 .* values(ta), -values(ta)), linewidth=2, legend=false)
    ta_ma = lead(moving(mean, ta, 7), 3) ## centered moving average 
    plot!(fig, ta_ma, color=:black, linewidth=2, legend=false)
    ticks = Date(2020, 03, 1):Month(1):Date(now())
    labels = monthabbr.(ticks)
    labels[1] = labels[1] * "\n 2020 "
    xticks!(fig, Dates.value.(ticks), (labels))
    return fig
end


function make_daily_plot(ts_deaths, ts_confirmed, title; plotsize=(900, 300))
    fig1 = plot_helper(my_diff(ts_deaths))
    title!(fig1, title * ", deaths", titlelocation=:left, top_margin=[5mm 0mm])
    ylabel!(fig1, "daily per million")

    fig2 = plot_helper(my_diff(ts_confirmed))
    title!(fig2, title * ", confirmed cases", titlelocation=:left, top_margin=[5mm 0mm])
    ylabel!(fig2, "daily per million")

    return plot(fig1, fig2, size=plotsize, layout=2)
end 


function plot_country_pc_daily(country, df; plotsize=(900, 300))
    return make_daily_plot(
        get_country_pc(country, :global_deaths, df),
        get_country_pc(country, :global_confirmed, df),
        country,
        plotsize=plotsize
    )
end 


function plot_county_pc_daily(county, state, df; plotsize=(900, 300))
    return make_daily_plot(
        get_county_pc(county, state, :us_deaths, df),
        get_county_pc(county, state, :us_confirmed, df),
        county * ", " * state,
        plotsize=plotsize
    )
end 


function plot_state_pc_daily(state, df; plotsize=(900, 300))
    return make_daily_plot(
        get_state_pc(state, :us_deaths, df),
        get_state_pc(state, :us_confirmed, df),
        state,
        plotsize=plotsize
    )
end 

end
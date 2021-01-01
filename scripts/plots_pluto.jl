### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ ec11d8d0-fd05-11ea-2189-1b096f078de8
begin 
	_BASE_DIR = joinpath(@__DIR__, "..")
	push!(LOAD_PATH, joinpath(_BASE_DIR, ".."))
	using CovidTracker
end

# ╔═╡ 4919d9ae-08a7-11eb-0175-0fe71b8db012
begin 
	using FredData
	using Plots
	using DataFrames
end

# ╔═╡ e99694a6-fd0a-11ea-2dd9-179b70451bf0
using Suppressor

# ╔═╡ 0f9ceab2-fd09-11ea-32d8-c1304a7f9376
md"# Covid Tracker"

# ╔═╡ 3103d952-fd06-11ea-395f-a10c789cb86a
df = download_covid_data();

# ╔═╡ e8c1815e-fd07-11ea-0cbb-d5daf30c4e9c
_SIZE = (690, 250); # plotsize

# ╔═╡ c7558f52-fd08-11ea-30ed-ebd7c991b321
md"# State Plots"

# ╔═╡ 65e8b246-fd06-11ea-1df9-ed694f847f2f
plot_county_pc_daily("Hennepin", "Minnesota", df, plotsize=_SIZE)

# ╔═╡ 71d87f46-fd06-11ea-0168-37c7107f4d7a
plot_state_pc_daily("Minnesota", df, plotsize=_SIZE)

# ╔═╡ 7ee5e6ba-fd06-11ea-2cfc-b97755bc959e
plot_state_pc_daily("New York", df, plotsize=_SIZE)

# ╔═╡ 7ee86b7c-fd06-11ea-2272-9b873ee020f8
plot_state_pc_daily("Florida", df, plotsize=_SIZE)

# ╔═╡ 7eef58a6-fd06-11ea-1747-cb1b50cee4c5
plot_state_pc_daily("Texas", df, plotsize=_SIZE)

# ╔═╡ 7ef6f572-fd06-11ea-172b-356ed2e76722
plot_state_pc_daily("California", df, plotsize=_SIZE)

# ╔═╡ 7efea06a-fd06-11ea-3fe6-3d6eb3a810a5
plot_state_pc_daily("Arizona", df, plotsize=_SIZE)

# ╔═╡ 7f063726-fd06-11ea-0ba7-0924624c659a
plot_state_pc_daily("New Mexico", df, plotsize=_SIZE)

# ╔═╡ 7f0dfc40-fd06-11ea-296a-0f8d65619fc2
plot_state_pc_daily("Vermont", df, plotsize=_SIZE)

# ╔═╡ 7f155a76-fd06-11ea-2e10-85998d77d4a0
plot_state_pc_daily("Massachusetts", df, plotsize=_SIZE)

# ╔═╡ 7f1d02ce-fd06-11ea-1cdb-1f98d47362ab
plot_county_pc_daily("Middlesex", "Massachusetts", df, plotsize=_SIZE)

# ╔═╡ 47841604-fd08-11ea-15fd-490e2dc17662
md"# Country plots"

# ╔═╡ 7f24a832-fd06-11ea-33a8-5d871907a601
plot_country_pc_daily("US", df, plotsize=_SIZE)

# ╔═╡ 7f2c3f8c-fd06-11ea-3bf2-23dc369b0b90
plot_country_pc_daily("Dominican Republic", df, plotsize=_SIZE)

# ╔═╡ 7f33ec86-fd06-11ea-1fd8-9722d0a9c376
plot_country_pc_daily("Ireland", df, plotsize=_SIZE)

# ╔═╡ 7f3b8ca0-fd06-11ea-2d58-0ba4d7fccf65
plot_country_pc_daily("Cuba", df, plotsize=_SIZE)

# ╔═╡ 5df496e8-fd08-11ea-343f-f92c87fa067e
md"## Europe"

# ╔═╡ 7f432172-fd06-11ea-118f-a50ab5bc2e7a
plot_country_pc_daily("United Kingdom", df, plotsize=_SIZE)

# ╔═╡ 7f4ae2a4-fd06-11ea-11f4-d9bc1d7d1768
plot_country_pc_daily("Greece", df, plotsize=_SIZE)

# ╔═╡ 7f526380-fd06-11ea-0c5c-39d1c3ad5580
plot_country_pc_daily("Spain", df, plotsize=_SIZE)

# ╔═╡ 7f5a2c0a-fd06-11ea-19d9-c176f6d2abe7
plot_country_pc_daily("Italy", df, plotsize=_SIZE)

# ╔═╡ 7f61c688-fd06-11ea-2614-312b8bbe79c8
plot_country_pc_daily("Germany", df, plotsize=_SIZE)

# ╔═╡ 7f694dd4-fd06-11ea-39ad-4f5761b954e3
plot_country_pc_daily("France", df, plotsize=_SIZE)

# ╔═╡ 7f7115fa-fd06-11ea-0dbf-19bf26be9122
plot_country_pc_daily("Switzerland", df, plotsize=_SIZE)

# ╔═╡ 7f788fce-fd06-11ea-3083-0b61b333128d
plot_country_pc_daily("Norway", df, plotsize=_SIZE)

# ╔═╡ 7f82249e-fd06-11ea-25ae-d52a4bfecb1f
plot_country_pc_daily("Denmark", df, plotsize=_SIZE)

# ╔═╡ 7f896362-fd06-11ea-3cc9-3bf484ce2051
plot_country_pc_daily("Sweden", df, plotsize=_SIZE)

# ╔═╡ 8ca01526-fd08-11ea-2cc7-b744fbaac09e
md"## Latin America"

# ╔═╡ 7f9120ac-fd06-11ea-3367-238c6ea57319
plot_country_pc_daily("Chile", df, plotsize=_SIZE)

# ╔═╡ 7f98bf10-fd06-11ea-1fb0-2585bd7d0208
plot_country_pc_daily("Brazil", df, plotsize=_SIZE)

# ╔═╡ 7fa063dc-fd06-11ea-2590-71d728a03c00
plot_country_pc_daily("Peru", df, plotsize=_SIZE)

# ╔═╡ 7fa80362-fd06-11ea-2ec8-bd4212ed708a
plot_country_pc_daily("Ecuador", df, plotsize=_SIZE)

# ╔═╡ 7fafa9a8-fd06-11ea-0faa-f76b7b2f8036
plot_country_pc_daily("Mexico", df, plotsize=_SIZE)

# ╔═╡ 7fb8cde6-fd06-11ea-03fa-a12c9f5e8fa0
plot_country_pc_daily("Uruguay", df, plotsize=_SIZE)

# ╔═╡ 7fc05dc4-fd06-11ea-2224-7165e83fecc5
plot_country_pc_daily("Haiti", df, plotsize=_SIZE)

# ╔═╡ 7fc7fe4c-fd06-11ea-24c2-19793135096c
plot_country_pc_daily("Argentina", df, plotsize=_SIZE)

# ╔═╡ 7fcfadca-fd06-11ea-0dd1-d3cd0c1d072b
plot_country_pc_daily("India", df, plotsize=_SIZE)

# ╔═╡ 7fd7647c-fd06-11ea-0885-271cca42df16
plot_country_pc_daily("Vietnam", df, plotsize=_SIZE)

# ╔═╡ 7fdf96ba-fd06-11ea-3fb6-df0b108ade92
plot_country_pc_daily("Japan", df, plotsize=_SIZE)

# ╔═╡ 3c9587d2-08a7-11eb-34d0-a97c022d29a6
md"## A Comparison between Nordic Countries"

# ╔═╡ 5d54884c-08a7-11eb-1b86-cd66c1940655
# make sure you have your API key access set up 
# https://github.com/micahjsmith/FredData.jl
f = Fred();

# ╔═╡ 40e7dba4-08a8-11eb-364d-4d7c0310a4b3
begin 
	# Quarterly real GDP at 2010 constant prices
	sweden_gdp = get_data(f, "CLVMNACSCAB1GQSE")
	denmark_gdp = get_data(f, "CLVMNACSCAB1GQDK")
	norway_gdp = get_data(f, "CLVMNACSCAB1GQNO")
	finland_gdp = get_data(f, "CLVMNACSCAB1GQFI")
end;

# ╔═╡ c98d92c2-08b8-11eb-0842-5578c71efe60
md"By not locking down, Sweden saved around 2% of GDP with respect to its neighbors in 2020 Q1."

# ╔═╡ c3d0de5c-08ac-11eb-0a9e-13359b572b4d
# NOTE: norway quarterly GDP data may be off by a month

# ╔═╡ 15d357d6-08ad-11eb-05a0-259aa2e3f4aa
md"### Cost of life calculation"

# ╔═╡ f24f317e-08b4-11eb-2634-79df3eef4594
md"Sweden avoided the GDP drop of its neighbors in 2020Q1."

# ╔═╡ ac726ca8-08b1-11eb-0ec8-2fd4abefa117
md"What if Sweden had the death rate of Norway, but GDP will have fallen as much as in Norway in the 2020Q2.? What's the GDP gain per unit of life lost?"

# ╔═╡ 41e3c9b2-fd0b-11ea-22d4-d57677701e55
md"## Auxiliary functions"

# ╔═╡ 0a5d266a-08ae-11eb-0095-6fbbd3faeff3
function total_deaths(country)
	DATE_STR = r"^\d{1,2}\/\d{1,2}\/\d{2}$"
	return filter(x-> x["Country/Region"] === country, df[:global_deaths]) |>
        x -> x[!, DATE_STR] |>
        x -> mapcols(sum ∘ skipmissing, x) |>
		x -> x[end][1]
end 

# ╔═╡ 9873e1d2-08ae-11eb-0bca-0fb57197e13f
begin 
	death_rate_NOR = total_deaths("Norway") / get_pop("NO")
	death_rate_SWE = total_deaths("Sweden") / get_pop("SE")
end;

# ╔═╡ 50dc4974-08b1-11eb-3260-dde8a11c4678
# https://stackoverflow.com/questions/52213829/in-julia-insert-commas-into-integers-for-printing-like-python-3-6

function commas(num::Integer)
    str = string(num)
    return replace(str, r"(?<=[0-9])(?=(?:[0-9]{3})+(?![0-9]))" => ",")
end

# ╔═╡ 60fd65f2-fd0a-11ea-1dd8-0b4c9df11b4d
function with_terminal(f)
	local spam_out, spam_err
	@color_output false begin
		spam_out = @capture_out begin
			spam_err = @capture_err begin
				f()
			end
		end
	end
	spam_out, spam_err
	
	HTML("""
		<style>
		div.vintage_terminal {
			
		}
		div.vintage_terminal pre {
			color: #ddd;
			background-color: #333;
			border: 5px solid pink;
			font-size: .75rem;
		}
		
		</style>
	<div class="vintage_terminal">
		<pre>$(Markdown.htmlesc(spam_out))</pre>
	</div>
	""")
end

# ╔═╡ f5476a3c-fd0a-11ea-0de3-cf7b5b7e4ab1
begin 
	import Dates
	with_terminal() do 
		println("Today's date: ", Dates.Date(Dates.now()))
		println("Database last date: ", names(df.us_confirmed)[end])
	end
end

# ╔═╡ 5d830c60-08a9-11eb-1c11-2f4fcf135386
function normalize(series; date=Dates.Date(2019,10, 1))
	idx = findfirst(x -> x >= date, series.data["date"]) 
	series.data["value"] / series.data["value"][idx]
end

# ╔═╡ 0cf38670-08af-11eb-1ef8-fda375e5304c
begin
	# annual GDP for Sweden in current USD 
	annual_GDP_SWE_USD = get_data(f, "MKTGDPSEA646NWDB").data["value"][end]
	
	# quarterly value
	quarterly_GDP_SWE_USD = annual_GDP_SWE_USD / 4
	
	# counter_factual_deaths if Sweden had Norway mortality rate
	counter_factual_deaths_saved_SWE = get_pop("SE") * 
		(death_rate_SWE - death_rate_NOR)
	
	idx_NOR = findfirst(
		x -> x >= Dates.Date(2020,01,01), 
		norway_gdp.data["date"]
	) 
	idx_SWE = findfirst(
		x -> x >= Dates.Date(2020,01,01), 
		sweden_gdp.data["date"]
	) 
	
	# counter factual GDP loss if Sweden GDP would have fallen in 2020 Q2 by the same
	# amount as Norway
	counter_factual_gdp_loss_SWE_USD = quarterly_GDP_SWE_USD *
		(1 - normalize(norway_gdp)[idx_NOR] / normalize(sweden_gdp)[idx_SWE])
end;

# ╔═╡ 41b74b08-08b4-11eb-0069-69546f2febf3
value_of_life = counter_factual_gdp_loss_SWE_USD / counter_factual_deaths_saved_SWE

# ╔═╡ 58700016-08b0-11eb-1f79-1901b921f93e
md"The counter factual value of life is **USD $(commas(convert(Int64, round(value_of_life))))**. "

# ╔═╡ 37f42c3c-08ab-11eb-337c-a9bba0941e3b
function normalized_gdp_plots(; range=20, legendpos=:bottom) 
	fig = plot(
		sweden_gdp.data["date"][end-range:end], 
		log.(normalize(sweden_gdp)[end-range:end]), 
		label="SWE", lw=2, marker=:auto, 
		legend=legendpos,
		title="Log Quarterly Real GDP, SA\n2019Q4 = 0",
		format="png")
	plot!(fig, 
		denmark_gdp.data["date"][end-range:end], 
		log.(normalize(denmark_gdp)[end-range:end]), 
		label="DNK", lw=2, marker=:auto)
	plot!(fig, 
		norway_gdp.data["date"][end-range:end], 
		log.(normalize(norway_gdp)[end-range:end]), 
		label="NOR", lw=2, marker=:auto)
	plot!(fig, 
		finland_gdp.data["date"][end-range:end], 
		log.(normalize(finland_gdp)[end-range:end]), 
		label="FIN", lw=2, marker=:auto)
	return fig
end

# ╔═╡ 7b14ee66-08a8-11eb-0abf-1bbf90781838
normalized_gdp_plots(range=20)

# ╔═╡ d770e20c-08ab-11eb-2aa9-3f699d5d3439
normalized_gdp_plots(range=4)

# ╔═╡ Cell order:
# ╟─0f9ceab2-fd09-11ea-32d8-c1304a7f9376
# ╟─f5476a3c-fd0a-11ea-0de3-cf7b5b7e4ab1
# ╠═ec11d8d0-fd05-11ea-2189-1b096f078de8
# ╠═3103d952-fd06-11ea-395f-a10c789cb86a
# ╠═e8c1815e-fd07-11ea-0cbb-d5daf30c4e9c
# ╟─c7558f52-fd08-11ea-30ed-ebd7c991b321
# ╟─65e8b246-fd06-11ea-1df9-ed694f847f2f
# ╟─71d87f46-fd06-11ea-0168-37c7107f4d7a
# ╟─7ee5e6ba-fd06-11ea-2cfc-b97755bc959e
# ╟─7ee86b7c-fd06-11ea-2272-9b873ee020f8
# ╟─7eef58a6-fd06-11ea-1747-cb1b50cee4c5
# ╟─7ef6f572-fd06-11ea-172b-356ed2e76722
# ╟─7efea06a-fd06-11ea-3fe6-3d6eb3a810a5
# ╟─7f063726-fd06-11ea-0ba7-0924624c659a
# ╟─7f0dfc40-fd06-11ea-296a-0f8d65619fc2
# ╟─7f155a76-fd06-11ea-2e10-85998d77d4a0
# ╟─7f1d02ce-fd06-11ea-1cdb-1f98d47362ab
# ╟─47841604-fd08-11ea-15fd-490e2dc17662
# ╟─7f24a832-fd06-11ea-33a8-5d871907a601
# ╟─7f2c3f8c-fd06-11ea-3bf2-23dc369b0b90
# ╟─7f33ec86-fd06-11ea-1fd8-9722d0a9c376
# ╟─7f3b8ca0-fd06-11ea-2d58-0ba4d7fccf65
# ╟─5df496e8-fd08-11ea-343f-f92c87fa067e
# ╟─7f432172-fd06-11ea-118f-a50ab5bc2e7a
# ╟─7f4ae2a4-fd06-11ea-11f4-d9bc1d7d1768
# ╟─7f526380-fd06-11ea-0c5c-39d1c3ad5580
# ╟─7f5a2c0a-fd06-11ea-19d9-c176f6d2abe7
# ╟─7f61c688-fd06-11ea-2614-312b8bbe79c8
# ╟─7f694dd4-fd06-11ea-39ad-4f5761b954e3
# ╟─7f7115fa-fd06-11ea-0dbf-19bf26be9122
# ╟─7f788fce-fd06-11ea-3083-0b61b333128d
# ╟─7f82249e-fd06-11ea-25ae-d52a4bfecb1f
# ╟─7f896362-fd06-11ea-3cc9-3bf484ce2051
# ╟─8ca01526-fd08-11ea-2cc7-b744fbaac09e
# ╟─7f9120ac-fd06-11ea-3367-238c6ea57319
# ╟─7f98bf10-fd06-11ea-1fb0-2585bd7d0208
# ╟─7fa063dc-fd06-11ea-2590-71d728a03c00
# ╟─7fa80362-fd06-11ea-2ec8-bd4212ed708a
# ╟─7fafa9a8-fd06-11ea-0faa-f76b7b2f8036
# ╟─7fb8cde6-fd06-11ea-03fa-a12c9f5e8fa0
# ╟─7fc05dc4-fd06-11ea-2224-7165e83fecc5
# ╟─7fc7fe4c-fd06-11ea-24c2-19793135096c
# ╟─7fcfadca-fd06-11ea-0dd1-d3cd0c1d072b
# ╟─7fd7647c-fd06-11ea-0885-271cca42df16
# ╟─7fdf96ba-fd06-11ea-3fb6-df0b108ade92
# ╟─3c9587d2-08a7-11eb-34d0-a97c022d29a6
# ╠═4919d9ae-08a7-11eb-0175-0fe71b8db012
# ╠═5d54884c-08a7-11eb-1b86-cd66c1940655
# ╠═40e7dba4-08a8-11eb-364d-4d7c0310a4b3
# ╠═7b14ee66-08a8-11eb-0abf-1bbf90781838
# ╠═d770e20c-08ab-11eb-2aa9-3f699d5d3439
# ╟─c98d92c2-08b8-11eb-0842-5578c71efe60
# ╠═c3d0de5c-08ac-11eb-0a9e-13359b572b4d
# ╟─15d357d6-08ad-11eb-05a0-259aa2e3f4aa
# ╟─f24f317e-08b4-11eb-2634-79df3eef4594
# ╟─ac726ca8-08b1-11eb-0ec8-2fd4abefa117
# ╠═9873e1d2-08ae-11eb-0bca-0fb57197e13f
# ╠═0cf38670-08af-11eb-1ef8-fda375e5304c
# ╠═41b74b08-08b4-11eb-0069-69546f2febf3
# ╟─58700016-08b0-11eb-1f79-1901b921f93e
# ╟─41e3c9b2-fd0b-11ea-22d4-d57677701e55
# ╠═e99694a6-fd0a-11ea-2dd9-179b70451bf0
# ╠═5d830c60-08a9-11eb-1c11-2f4fcf135386
# ╠═37f42c3c-08ab-11eb-337c-a9bba0941e3b
# ╠═0a5d266a-08ae-11eb-0095-6fbbd3faeff3
# ╠═50dc4974-08b1-11eb-3260-dde8a11c4678
# ╠═60fd65f2-fd0a-11ea-1dd8-0b4c9df11b4d

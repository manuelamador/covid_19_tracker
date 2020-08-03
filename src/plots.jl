#src This file is to be read with Literate.jl by "scripts/make.jl" and generates the jupyter notebook with the plots. 

# # Covid-19 tracker

# Updated on DATEOFTODAY
# 
# Written in Julia 1.4 

# ## Code

include(joinpath(dirname(@__FILE__), "..", "src", "covid_19_tracker.jl"));

# ## Getting the get_data

df = download_covid_data();

# ## US County/State plots

plot_county_pc_daily("Hennepin", "Minnesota", df)
#-
plot_state_pc_daily("Minnesota", df)
#-
plot_state_pc_daily("New York", df)
#-
plot_state_pc_daily("Florida", df)
#-
plot_state_pc_daily("Texas", df)
#-
plot_state_pc_daily("California", df)
#-
plot_state_pc_daily("Arizona", df)
#-
plot_state_pc_daily("New Mexico", df)
#-
plot_state_pc_daily("Vermont", df)
#-
plot_state_pc_daily("Massachusetts", df)
#-
plot_county_pc_daily("Middlesex", "Massachusetts", df)

# ## Country plots

plot_country_pc_daily("US", df)
#-
plot_country_pc_daily("Dominican Republic", df)
#-
plot_country_pc_daily("Ireland", df)
#-
plot_country_pc_daily("Cuba", df)

# ### Europe

plot_country_pc_daily("United Kingdom", df)
#-
plot_country_pc_daily("Greece", df)
#-
plot_country_pc_daily("Spain", df)
#-
plot_country_pc_daily("Italy", df)
#-
plot_country_pc_daily("Germany", df)
#-
plot_country_pc_daily("France", df)
#-
plot_country_pc_daily("Norway", df)
#-
plot_country_pc_daily("Denmark", df)
#-
plot_country_pc_daily("Sweden", df)


# ### Latin America 

plot_country_pc_daily("Chile", df)
#-
plot_country_pc_daily("Brazil", df)
#-
plot_country_pc_daily("Peru", df)
#-
plot_country_pc_daily("Ecuador", df)
#-
plot_country_pc_daily("Mexico", df)
#-
plot_country_pc_daily("Uruguay", df)
#-
plot_country_pc_daily("Haiti", df)
#-
plot_country_pc_daily("Argentina", df)

# ### Asia 

plot_country_pc_daily("India", df)
#-
plot_country_pc_daily("Vietnam", df)
#-
plot_country_pc_daily("Japan", df)

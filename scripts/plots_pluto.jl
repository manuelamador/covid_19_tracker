### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ ec11d8d0-fd05-11ea-2189-1b096f078de8
begin 
	_BASE_DIR = joinpath(@__DIR__, "..")
	push!(LOAD_PATH, joinpath(_BASE_DIR, ".."))
	using CovidTracker
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

# ╔═╡ 41e3c9b2-fd0b-11ea-22d4-d57677701e55
md"## Auxiliary functions"

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
	end
end

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
# ╟─41e3c9b2-fd0b-11ea-22d4-d57677701e55
# ╠═e99694a6-fd0a-11ea-2dd9-179b70451bf0
# ╠═60fd65f2-fd0a-11ea-1dd8-0b4c9df11b4d

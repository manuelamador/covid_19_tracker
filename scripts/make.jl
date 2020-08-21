# Uses Literate.jl to generate the `plots.ipynb` file in `output`
#
# 

using Dates
using Literate

const PATH_SRC =  joinpath(dirname(@__FILE__), "..", "src")
const PATH_OUTPUT =  joinpath(dirname(@__FILE__), "..", "output")

function replace_date(content)
    content = replace(content, "DATEOFTODAY" => Date(now()))
    return content
end

# function replace_includes(str)
#     included = ["covid19.jl"]
#     for ex in included
#         content = read(joinpath(PATH_SRC, ex), String)
#         str = replace(str, "include(\"$(ex)\")" => content)
#     end
#     return str
# end

_STORE_ENV = haskey(ENV, "GKSWSTYPE") ? ENV["GKSWSTYPE"] : ""
ENV["GKSwstype"]="nul"

Literate.notebook(
    joinpath(PATH_SRC, "plots.jl"), 
    joinpath(PATH_OUTPUT);
    preprocess= replace_date 
)

_STORE_ENV=="" ? delete!(ENV, "GKSWSTYPE") : ENV["GKSWSTYPE"] = _STORE_ENV;
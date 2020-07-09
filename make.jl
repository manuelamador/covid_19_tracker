using Dates
using Literate

const PATH_SRC =  "src"
const PATH_OUTPUT =  "output"

function replace_date(content)
    content = replace(content, "DATEOFTODAY" => Date(now()))
    return content
end

function replace_includes(str)

    included = ["covid19.jl"]

    # Here the path loads the files from their proper directory,
    # which may not be the directory of the `examples.jl` file!

    for ex in included
        content = read(joinpath(PATH_SRC, ex), String)
        str = replace(str, "include(\"$(ex)\")" => content)
    end
    return str
end

Literate.notebook(
    joinpath(PATH_SRC, "plots.jl"), 
    joinpath(pwd(), PATH_OUTPUT);
    preprocess= x -> replace_includes(replace_date(x))
)
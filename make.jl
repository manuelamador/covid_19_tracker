using Dates

function replace_date(content)
    content = replace(content, "DATEOFTODAY" => Date(now()))
    return content
end

function replace_includes(str)

    included = ["covid19.jl"]

    # Here the path loads the files from their proper directory,
    # which may not be the directory of the `examples.jl` file!
    path = ""

    for ex in included
        content = read(path*ex, String)
        str = replace(str, "include(\"$(ex)\")" => content)
    end
    return str
end

Literate.notebook("plots.jl", preprocess= x -> replace_includes(replace_date(x))  )
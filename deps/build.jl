using CUDAapi, Pkg

const config_path = joinpath(@__DIR__, "ext.jl")

function write_to_deps(pkg, uuid)
    project_path = joinpath(@__DIR__, "..", "Project.toml")
    project = Pkg.TOML.parsefile(project_path)
    project["deps"][pkg] = uuid

    open(project_path, "w") do f
        Pkg.TOML.print(f, project)
    end
end

function main()
    libcuda_path = find_cuda_library("cuda", find_toolkit())
    if libcuda_path === nothing
        open(config_path, "w") do io
            println(io, "# autogenerated file, do not edit")
            println(io, "const USE_CUDA = false")
        end
    else
        open(config_path, "w") do io
            println(io, "# autogenerated file, do not edit")
            println(io, "const USE_CUDA = true")
        end
        write_to_deps("CuArrays", "3a865a2d-5b23-5a0f-bc46-62713ec82fae")
    end
end

main()

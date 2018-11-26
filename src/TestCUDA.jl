module TestCUDA

const ext = joinpath(dirname(@__DIR__), "deps", "ext.jl")
isfile(ext) || error("TestCUDA.jl has not been built, please run Pkg.build(\"TestCUDA\").")
include(ext)

@static if USE_CUDA
    include("cuda.jl")
end

# using Requires
#
# @init @require CuArrays="3a865a2d-5b23-5a0f-bc46-62713ec82fae" include("cuda/cuda.jl")

end # module

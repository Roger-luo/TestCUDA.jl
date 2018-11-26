module TestCUDA

const ext = joinpath(dirname(@__DIR__), "deps", "ext.jl")
isfile(ext) || error("Batched.jl has not been built, please run Pkg.build(\"Batched\").")
include(ext)

# using Requires
#
# @init @require CuArrays="3a865a2d-5b23-5a0f-bc46-62713ec82fae" include("cuda/cuda.jl")

end # module

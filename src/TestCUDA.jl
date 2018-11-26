module TestCUDA

using Requires

@init @require CuArrays="3a865a2d-5b23-5a0f-bc46-62713ec82fae" include("cuda/cuda.jl")

end # module

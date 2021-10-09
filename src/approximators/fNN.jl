struct FNN <: AbstractApproximator
    n::Int
    m::Int
    NN::Flux.Chain
    function FNN(n::Int, m::Int, h_array::Vector{Int}, act)
        node_array = [n+m, h_array..., 1]
        new(n, m, construct_layer_array(node_array, act))
    end
end

"""
    (nn::FNN)(x, u)

Infer using two input arguments `x` and `u`.
# Notes
size(x) = (n, d)
size(u) = (m, d)
"""
function (nn::FNN)(x, u)
    res = nn.NN(vcat(x, u))  # make it tuple
    return res
end

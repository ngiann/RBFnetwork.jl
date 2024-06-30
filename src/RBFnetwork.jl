module RBFnetwork

    using Distances
    using ArgCheck
    using Random

    include("rbf.jl")

    export RBF, makerbf, numparam

end

struct RBF{T}

    Q::Int64
    K::Int64
    D::Int64
    centres::T

end

function Base.show(io::IO, rbf::RBF)

    print(io, "RBF network with ", rbf.K," centres, input dimensionality ", rbf.Q, ", output dimensionality ", rbf.D)

end

makerbf(centres, D) = RBF(size(centres,1), size(centres,2), D, centres)

function (rbf::RBF)(Y, r²)

    @argcheck size(Y, 1) == rbf.Q "Data must be passed as D×N matrix, got "*string(size(Y,1))*"×"*string(size(Y,2))

    D² = pairwise(SqEuclidean(), rbf.centres, Y, dims=2)

    [exp.(- D² / (2*r²)); ones(1, size(Y, 2))]

end

numparam(rbf::RBF) = rbf.D*(rbf.K + 1) # plus 1 for the bias term

Random.randn(rbf) = randn(rbf.D, rbf.K+1)



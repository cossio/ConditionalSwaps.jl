module ConditionalSwaps

using Base.Broadcast: broadcasted

"""
    swap(conditions, x, y)

Returns `a, b`, where `a[i], b[i] == y[i], x[i]` or `a[i], b[i] == x[i], y[i]`,
depending to whether the corresponding `condition[i]` is true or false.
"""
function swap(conditions::Union{AbstractArray{Bool}, Bool}, x, y)
    x_new = ifelse.(conditions, y, x)
    y_new = ifelse.(conditions, x, y)
    return x_new, y_new
end

"""
    swap!(conditions, x, y)

Sets `x[i], y[i] == y[i], x[i]` or `x[i], y[i] == x[i], y[i]` in-place,
depending to whether the corresponding `condition[i]` is true or false.
"""
function swap!(conditions::Union{AbstractArray{Bool}, Bool}, x::AbstractArray, y::AbstractArray)
    if size(x) == size(y)
        b = broadcasted(tuple, CartesianIndices(x), CartesianIndices(y), conditions)
        for (ix, iy, c) in b
            if c
                x[ix], y[iy] = y[ix], x[iy]
            end
        end
        return x, y
    else
        throw(DimensionMismatch("x, y must have the same size"))
    end
end


end # module

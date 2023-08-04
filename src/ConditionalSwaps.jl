module ConditionalSwaps


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
    swap!(x, y, conditions)

Ses `x[i], y[i] == y[i], x[i]` or `x[i], y[i] == x[i], y[i]` in-place,
depending to whether the corresponding `condition[i]` is true or false.
"""
function swap!(x::AbstractArray, y::AbstractArray, conditions::Union{AbstractArray{Bool}, Bool})
    if size(x) != size(y)
        throw(ArgumentError("x and y must have the same size"))
    else
        for i in eachindex(x, y)
            if conditions[i]
                x[i], y[i] = y[i], x[i]
            else
                x[i], y[i] = x[i], y[i]
            end
        end
        return x, y
    end
end


end # module

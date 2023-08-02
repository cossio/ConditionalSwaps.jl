module ConditionalSwaps

"""
    swap(conditions, x, y)

Returns `a, b`, where `a[i], b[i] == y[i], x[i]` or `a[i], b[i] == x[i], y[i]`,
depending to whether the corresponding `condition[i]` is true or false.
"""
function swap(conditions, x, y)
    x_new = ifelse.(conditions, y, x)
    y_new = ifelse.(conditions, x, y)
    return x_new, y_new
end

end # module

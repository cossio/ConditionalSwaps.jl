# ConditionalSwaps

Implements a function

```julia
a, b = swap(conditions, x, y)
```

where `conditions` is a boolean array and `x, y` are two arrays of the same size. Returns `a, b`, such that `a[i], b[i] == y[i], x[i]` or `a[i], b[i] == x[i], y[i]`, depending to whether the corresponding `condition[i]` is `true` or `false`.

There is also an in-place version,

```julia
swap!(conditions, x, y)
```

which modifies `x, y`.

## Installation

Registered at https://github.com/cossio/CossioJuliaRegistry.
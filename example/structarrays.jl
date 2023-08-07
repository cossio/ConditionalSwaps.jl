using StructArrays: StructArray
using Random: bitrand
using ConditionalSwaps: swap
using Test: @test

#swap(condition::Bool, (x, y)) = condition ? (y, x) : (x, y)

function swap!(conditions::AbstractArray, x::AbstractArray, y::AbstractArray)
    A = StructArray((x, y))
    #a .= swap.(conditions, a)
    broadcast!(A, conditions, A) do cond, (x, y)
        cond ? (y, x) : (x, y)
    end
    return x, y
end

cond = bitrand(10, 7)
A = randn(size(cond))
B = randn(size(cond))
A_new, B_new = swap(cond, A, B)
swap!(cond, A, B)
@test A == A_new
@test B == B_new

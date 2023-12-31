using Test: @testset, @test, @inferred
using Random: bitrand
using ConditionalSwaps: swap, swap!

@testset "swap (tests generated by copilot)" begin
    x = [1, 2, 3]
    y = [4, 5, 6]
    @test swap(falses(3), x, y) == swap(false, x, y) == (x, y)
    @test swap(trues(3), x, y)  == swap(true, x, y)  == (y, x)

    conditions = [true, false, true]
    x_new, y_new = @inferred swap(conditions, x, y)
    @test x_new == [4, 2, 6]
    @test y_new == [1, 5, 3]
end

@testset "swap (random tests)" begin
    cond = bitrand(10, 7)
    A = randn(size(cond))
    B = randn(size(cond))
    A_new, B_new = @inferred swap(cond, A, B)
    for i in 1:4, j in 1:3
        if cond[i,j] # swapped
            @test A_new[i,j] == B[i,j] && B_new[i,j] == A[i,j]
        else # not swapped
            @test A_new[i,j] == A[i,j] && B_new[i,j] == B[i,j]
        end
    end

    # negating the condition is equivalent to exchanging A, B
    @test swap((!).(cond), A, B) == swap(cond, B, A)

    # swapping twice with the same condition gives back the original arrays
    @test swap(cond, A_new, B_new) == (A, B)
end

@testset "swap! case 1: cond, A, B of same sizes" begin
    cond = bitrand(10, 7)
    A = randn(size(cond))
    B = randn(size(cond))
    A_new, B_new = swap(cond, A, B)
    @inferred swap!(cond, A, B)
    @test A == A_new
    @test B == B_new
end

@testset "swap! case 2: scalar condition" begin
    for cond in (true, false)
        A = randn(10, 7)
        B = randn(10, 7)
        _A, _B = copy(A), copy(B)
        @inferred swap!(cond, A, B)
        @test A == (cond ? _B : _A)
        @test B == (cond ? _A : _B)
    end
end

@testset "swap! case 3: non-trivial broadcast, part 1" begin
    cond = bitrand(10)
    A = randn(10, 7)
    B = randn(10, 7)
    A_new, B_new = swap(cond, A, B)
    @inferred swap!(cond, A, B)
    @test A == A_new
    @test B == B_new
end

@testset "swap! case 4: non-trivial broadcast, part 2" begin
    cond = bitrand(10, 1)
    A = randn(10, 7)
    B = randn(10, 7)
    A_new, B_new = swap(cond, A, B)
    @inferred swap!(cond, A, B)
    @test A == A_new
    @test B == B_new
end

@testset "swap! case 4: non-trivial broadcast, part 3" begin
    cond = bitrand(1, 7)
    A = randn(10, 7)
    B = randn(10, 7)
    A_new, B_new = swap(cond, A, B)
    @inferred swap!(cond, A, B)
    @test A == A_new
    @test B == B_new
end

module aqua_tests include("aqua.jl") end

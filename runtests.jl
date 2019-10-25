using Test

include("nth_prime.jl")


# Tests adapted from `problem-specifications//canonical-data.json` @ v2.1.0

println("\n"^2, "-"^60, "\n"^3)

@testset "first prime" begin
    @test prime(1) == 2
end
println()

@testset "second prime" begin
    @test prime(2) == 3
end
println()

@testset "sixth prime" begin
    @test prime(6) == 13
end
println()

@testset "big prime" begin
    @test prime(10001) == 104743
end
println()

@testset "there is no zeroth prime" begin
    @test_throws DomainError prime(0)
end
println()

# additional track specific test
@testset "first twenty primes" begin
    @test [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31,
                      37, 41, 43, 47, 53, 59, 61, 67, 71] ==
                     [prime(n)    for n = 1 : 20]
end

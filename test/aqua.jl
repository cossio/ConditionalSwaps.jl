import Aqua
import ConditionalSwaps

using Test: @testset

@testset "aqua" begin
    Aqua.test_all(
        ConditionalSwaps;
        project_toml_formatting=false
    )
end

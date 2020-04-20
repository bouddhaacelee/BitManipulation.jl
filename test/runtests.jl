using BitManipulation
using Test

@testset "BitManipulation.jl" begin
    #= only    a byte
    =#
    data_to_packs = falses(8, 2)
    data_to_packs[:, 1] = BitArray([1; 0; 1; 0; 0; 1; 0; 1]) 
    data_to_packs[:, 2] = BitArray([0; 1; 0; 1; 1; 0; 1; 0])
    expected_result = Array{UInt8, 2}(undef, 1, 2)
    expected_result[1, 1] = 0xa5
    expected_result[1, 2] = 0x5a
    @test expected_result == packbits(data_to_packs)
    
    data_to_packs = falses(16, 2)
    data_to_packs[:, 1] = BitArray([1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0]) 
    data_to_packs[:, 2] = BitArray([0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1]) 
    
    expected_result = Array{UInt8, 2}(undef, 2, 2)
    expected_result[1, :] = [0xa5, 0x5a]
    expected_result[2, :] = [0x5a, 0xa5]

    @test expected_result == packbits(data_to_packs)
    
    data_to_packs = falses(32, 4)
    data_to_packs[:, 1] = BitArray([1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0]) 
    data_to_packs[:, 2] = BitArray([0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1]) 
    data_to_packs[:, 3] = BitArray([1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0]) 
    data_to_packs[:, 4] = BitArray([0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1]) 
    
    expected_result = Array{UInt8, 2}(undef, 4, 4)
    expected_result[:, 1] = [0xa5, 0x5a, 0xa5, 0x5a]
    expected_result[:, 2] = [0x5a, 0xa5, 0x5a, 0xa5]
    expected_result[:, 3] = [0xa5, 0x5a, 0xa5, 0x5a]
    expected_result[:, 4] = [0x5a, 0xa5, 0x5a, 0xa5]
    @test expected_result == packbits(data_to_packs)

    data_to_packs = falses(6, 2)
    data_to_packs[:, 1] = BitArray([1, 0, 0, 1, 0, 1]) 
    data_to_packs[:, 2] = BitArray([0, 1, 1, 0, 1, 0])

    expected_result = Array{UInt8, 2}(undef, 1, 2)
    expected_result[:, 1] = [0x25]
    expected_result[:, 2] = [0x1a]

    @test expected_result == packbits(data_to_packs, 6)

    data_to_packs = falses(12, 2)
    data_to_packs[:, 1] = BitArray([1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1]) 
    data_to_packs[:, 2] = BitArray([0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0])

    expected_result = Array{UInt8, 2}(undef, 2, 2)
    expected_result[:, 1] = [0x25, 0x25]
    expected_result[:, 2] = [0x1a, 0x1a]

    @test expected_result == packbits(data_to_packs, 6)

    data_to_packs = falses(24, 2)
    data_to_packs[:, 1] = BitArray([1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1]) 
    data_to_packs[:, 2] = BitArray([0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0])

    expected_result = Array{UInt8, 2}(undef, 4, 2)
    expected_result[:, 1] = [0x25; 0x25; 0x25; 0x25]
    expected_result[:, 2] = [0x1a; 0x1a; 0x1a; 0x1a]

    @test expected_result == packbits(data_to_packs, 6)

    data_to_packs = falses(48, 2)
    data_to_packs[:, 1] = BitArray([1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1; 1; 0; 0; 1; 0; 1]) 
    data_to_packs[:, 2] = BitArray([0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0; 0; 1; 1; 0; 1; 0])

    expected_result = Array{UInt8, 2}(undef, 8, 2)
    expected_result[:, 1] = [0x25; 0x25; 0x25; 0x25; 0x25; 0x25; 0x25; 0x25]
    expected_result[:, 2] = [0x1a; 0x1a; 0x1a; 0x1a; 0x1a; 0x1a; 0x1a; 0x1a]

    @test expected_result == pack48bitsby6(data_to_packs)

    data_to_packs = falses(32, 4)
    data_to_packs[:, 1] = BitArray([0; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0]) 
    data_to_packs[:, 2] = BitArray([0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1]) 
    data_to_packs[:, 3] = BitArray([1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0]) 
    data_to_packs[:, 4] = BitArray([0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 1; 0; 1; 0; 1; 1; 0; 1; 0; 1; 0; 1; 0; 0; 1; 0; 0]) 
    
    expected_result = Array{UInt8, 2}(undef, 4, 4)
    expected_result[:, 1] = [0x25, 0x5a, 0xa5, 0x5a]
    expected_result[:, 2] = [0x5a, 0xa5, 0x5a, 0xa5]
    expected_result[:, 3] = [0xa5, 0x5a, 0xa5, 0x5a]
    expected_result[:, 4] = [0x5a, 0xa5, 0x5a, 0xa4]    
    @test data_to_packs == unpackbits(expected_result)   

end

using BitManipulation
using Test

@testset "BitManipulation.jl" begin
    #= only    a byte
    =#
    data_to_packs = falses(2, 8)
    data_to_packs[1, :] = BitArray([1, 0, 1, 0, 0, 1, 0, 1]) 
    data_to_packs[2, :] = BitArray([0, 1, 0, 1, 1, 0, 1, 0])

    expected_result = Array{UInt8, 2}(undef, 2, 1)
    expected_result[1, :] = [0xa5]
    expected_result[2, :] = [0x5a]

    @test expected_result == packbits(data_to_packs)
    
    data_to_packs = falses(2, 16)
    data_to_packs[1, :] = BitArray([1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0]) 
    data_to_packs[2, :] = BitArray([0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1]) 
    
    expected_result = Array{UInt8, 2}(undef, 2, 2)
    expected_result[1, :] = [0xa5, 0x5a]
    expected_result[2, :] = [0x5a, 0xa5]

    @test expected_result == packbits(data_to_packs)
    
    data_to_packs = falses(4, 32)
    data_to_packs[1, :] = BitArray([1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0]) 
    data_to_packs[2, :] = BitArray([0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1]) 
    data_to_packs[3, :] = BitArray([1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0]) 
    data_to_packs[4, :] = BitArray([0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1]) 
    
    expected_result = Array{UInt8, 2}(undef, 4, 4)
    expected_result[1, :] = [0xa5, 0x5a, 0xa5, 0x5a]
    expected_result[2, :] = [0x5a, 0xa5, 0x5a, 0xa5]
    expected_result[3, :] = [0xa5, 0x5a, 0xa5, 0x5a]
    expected_result[4, :] = [0x5a, 0xa5, 0x5a, 0xa5]
    @test expected_result == packbits(data_to_packs)

    data_to_packs = falses(2, 6)
    data_to_packs[1, :] = BitArray([1, 0, 0, 1, 0, 1]) 
    data_to_packs[2, :] = BitArray([0, 1, 1, 0, 1, 0])

    expected_result = Array{UInt8, 2}(undef, 2, 1)
    expected_result[1, :] = [0x25]
    expected_result[2, :] = [0x1a]

    @test expected_result == packbits(data_to_packs, 6)

    data_to_packs = falses(2, 12)
    data_to_packs[1, :] = BitArray([1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1]) 
    data_to_packs[2, :] = BitArray([0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0])

    expected_result = Array{UInt8, 2}(undef, 2, 2)
    expected_result[1, :] = [0x25, 0x25]
    expected_result[2, :] = [0x1a, 0x1a]

    @test expected_result == packbits(data_to_packs, 6)

    data_to_packs = falses(2, 24)
    data_to_packs[1, :] = BitArray([1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1]) 
    data_to_packs[2, :] = BitArray([0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0])

    expected_result = Array{UInt8, 2}(undef, 2, 4)
    expected_result[1, :] = [0x25, 0x25, 0x25, 0x25]
    expected_result[2, :] = [0x1a, 0x1a, 0x1a, 0x1a]

    @test expected_result == packbits(data_to_packs, 6)

    data_to_packs = falses(2, 48)
    data_to_packs[1, :] = BitArray([1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1]) 
    data_to_packs[2, :] = BitArray([0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0])

    expected_result = Array{UInt8, 2}(undef, 2, 8)
    expected_result[1, :] = [0x25, 0x25, 0x25, 0x25, 0x25, 0x25, 0x25, 0x25]
    expected_result[2, :] = [0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a]

    @test expected_result == pack48bitsby6(data_to_packs)

end

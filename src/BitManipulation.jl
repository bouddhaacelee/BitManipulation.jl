module BitManipulation
    """
    Packs the elements of a binary-valued array into bits in a uint8 array.
    The result is padded to full bytes by inserting zero bits at the end.
    """
    function packbits(data_to_packs::BitArray, bits_count::Int=8)
        size_of_data_packed = size(data_to_packs, 1) ÷ bits_count
        data_packed = zeros(UInt8, size_of_data_packed, size(data_to_packs, 2))
        for x = 1:size_of_data_packed
            data_packed[x, :] = data_to_packs[1 + (x-1)*bits_count, :]
            for i = 2:bits_count
                data_packed[x, :] .<<= 1
                data_packed[x, :] .|= data_to_packs[i + (x-1)*bits_count, :]
            end
        end
        return data_packed
    end

    """
    Packs the 48 elements of a binary-valued array into bits by 6 in a uint8 array.
    """


    function pack48bitsby6(data_to_packs::BitArray)
        data_packed = zeros(UInt8, 8, size(data_to_packs, 2))
        for x = 1:8
            data_packed[x, :] = data_to_packs[1 + (x-1)*6, :]
            for i = 2:6
                data_packed[x, :] .<<= 1
                data_packed[x, :] .|= data_to_packs[i + (x-1)*6, :]
            end
        end
        return data_packed
    end

    export packbits, pack48bitsby6

end # module

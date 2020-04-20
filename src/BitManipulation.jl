module BitManipulation
    
    function unpackbits(data_to_unpack::Array{UInt8})
        #todo write tests
        x, y = size(data_to_unpack, 1), size(data_to_unpack, 2) * 8
        data_unpacked, temp = falses(x * y), falses(8, 1)
        for (cpt, j) in enumerate(eachindex(data_to_unpack))
            r = data_to_unpack[j]
            for i in eachindex(temp)
                d, r = divrem(r, 2^(8-i))
                temp[i, 1] = Bool(d)       
            end
            data_unpacked[1+8*(cpt-1):8+8*(cpt-1)] = temp
        end
        return reshape(data_unpacked, y, x)
    end

    """
    Packs the elements of a binary-valued array into bits in a uint8 array.
    The result is padded to full bytes by inserting zero bits at the end.
    TODO : eval thi smethod collect(Iterators.partition([1,2,3,4,5], 2))
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
    TODO : for this use macro or generated function
    """
    function pack48bitsby6(data_to_packs::BitArray)
        data_packed = zeros(UInt8, 8, size(data_to_packs, 2))
        for x = 1:8
            data_packed[x, :] = data_to_packs[6*x - 5, :]
            for i in 2:6
                data_packed[x, :] .<<= 1
                data_packed[x, :] .|= data_to_packs[i + (x-1)*6, :]
            end
        end
        return data_packed
    end

    export packbits, pack48bitsby6, unpackbits

end # module

module BitManipulation

    function packbits(data_to_packs::BitArray, bits_count::Int=8)
        size_of_data_packed = size(data_to_packs, 2) ÷ bits_count
        data_packed = zeros(UInt8, size(data_to_packs, 1), size_of_data_packed)
        for x = 1:size_of_data_packed
            data_packed[:, x] = data_to_packs[:, 1 + (x-1)*bits_count]
            for i = 2:bits_count
                data_packed[:, x] .<<= 1
                data_packed[:, x] .|= data_to_packs[:, i + (x-1)*bits_count]
            end
        end
        return data_packed
    end

    export packbits

end # module

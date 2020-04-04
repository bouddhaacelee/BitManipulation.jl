using BenchmarkTools
using BitManipulation

# b = @benchmarkable pack48bitsby6(data_to_packs) setup=(data_to_packs = falses(1, 48))
# tune!(b)
# run(b)

b = @benchmarkable packbits(data_to_packs, 6) setup=(data_to_packs = falses(1, 48))
tune!(b)
run(b)
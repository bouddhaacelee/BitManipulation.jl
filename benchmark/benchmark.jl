using BenchmarkTools
using BitManipulation

b = @benchmarkable packbits(data_to_packs, 6) setup=(data_to_packs = falses(1000000, 48))
tune!(b)
run(b)

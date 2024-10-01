These benchmarks were written to provide examples of how different memory layouts can affect performance.

Note that benchmarks are never an absolute truth. Depending on the data access patterns of tight loops the performance characteristics can change a lot. This is simply meant to show some techniques that are faster in certain cases.

`tight_arrays` contains an example of how separately heap allocating array elements vs keeping them within an array can affect performance. Note that I fudge the memory addresses of where the separate heap allocations end up by allocating random amounts of data before each element. This simulates the program running for a while and elements being added every now and the as opposed to all in one go.

`soa` contains examples of how the performance can differ for arrays that use:
- Structure of Arrays
- Array of Structures
- Separately heap allocated elements

Run the program using
```
odin run . -o:none
```

or

```
odin run . -o:speed
```

If you add the speed optimizations, then some vectorizations will kick in that will make things almost unrealistically fast, because you probably don't have such simple loops very often.

## Program output with `-o:none` on my computer:
```
Benchmark: Using thightly packed arrays over separate heap allocations
Scattered array age sum: 50.2209
Tight array age sum: 49.6808
Cache friendly method is 3.76 times faster

Benchmark: SoA vs AoS vs separate heap allocs
Scattered heap allocations age sum: 50.5475
Arrays of Structures age sum: 50.3688
Structure of Arrays age sum: 50.2382
For 0 bytes of extra data in Person struct: SoA is 1.05 times faster than AoS
For 0 bytes of extra data in Person struct: SoA is 3.96 times faster than scattered array
Scattered heap allocations age sum: 50.083
Arrays of Structures age sum: 49.9673
Structure of Arrays age sum: 50.2778
For 2 bytes of extra data in Person struct: SoA is 1.03 times faster than AoS
For 2 bytes of extra data in Person struct: SoA is 4.03 times faster than scattered array
Scattered heap allocations age sum: 49.632999
Arrays of Structures age sum: 50.2532
Structure of Arrays age sum: 49.983898
For 4 bytes of extra data in Person struct: SoA is 1.04 times faster than AoS
For 4 bytes of extra data in Person struct: SoA is 4.05 times faster than scattered array
Scattered heap allocations age sum: 50.007099
Arrays of Structures age sum: 50.2144
Structure of Arrays age sum: 49.900799
For 8 bytes of extra data in Person struct: SoA is 1.04 times faster than AoS
For 8 bytes of extra data in Person struct: SoA is 4.04 times faster than scattered array
Scattered heap allocations age sum: 49.828098
Arrays of Structures age sum: 49.632599
Structure of Arrays age sum: 49.946499
For 16 bytes of extra data in Person struct: SoA is 1.07 times faster than AoS
For 16 bytes of extra data in Person struct: SoA is 1.79 times faster than scattered array
Scattered heap allocations age sum: 49.8419
Arrays of Structures age sum: 50.326099
Structure of Arrays age sum: 50.123699
For 32 bytes of extra data in Person struct: SoA is 1.21 times faster than AoS
For 32 bytes of extra data in Person struct: SoA is 1.87 times faster than scattered array
Scattered heap allocations age sum: 50.125198
Arrays of Structures age sum: 49.7615
Structure of Arrays age sum: 49.9225
For 64 bytes of extra data in Person struct: SoA is 1.53 times faster than AoS
For 64 bytes of extra data in Person struct: SoA is 1.98 times faster than scattered array
Scattered heap allocations age sum: 49.5945
Arrays of Structures age sum: 49.805199
Structure of Arrays age sum: 49.7647
For 128 bytes of extra data in Person struct: SoA is 1.89 times faster than AoS
For 128 bytes of extra data in Person struct: SoA is 1.99 times faster than scattered array
Scattered heap allocations age sum: 49.3389
Arrays of Structures age sum: 50.137199
Structure of Arrays age sum: 50.1339
For 256 bytes of extra data in Person struct: SoA is 1.92 times faster than AoS
For 256 bytes of extra data in Person struct: SoA is 2.02 times faster than scattered array
Scattered heap allocations age sum: 49.9617
Arrays of Structures age sum: 50.2633
Structure of Arrays age sum: 49.782398
For 512 bytes of extra data in Person struct: SoA is 1.87 times faster than AoS
For 512 bytes of extra data in Person struct: SoA is 2.08 times faster than scattered array
Scattered heap allocations age sum: 50.3633
Arrays of Structures age sum: 49.9304
Structure of Arrays age sum: 50.083099
For 1024 bytes of extra data in Person struct: SoA is 2.22 times faster than AoS
For 1024 bytes of extra data in Person struct: SoA is 2.38 times faster than scattered array
Scattered heap allocations age sum: 50.208199
Arrays of Structures age sum: 49.8356
Structure of Arrays age sum: 50.1306
For 1500 bytes of extra data in Person struct: SoA is 2.33 times faster than AoS
For 1500 bytes of extra data in Person struct: SoA is 2.63 times faster than scattered array
Scattered heap allocations age sum: 49.9865
Arrays of Structures age sum: 49.938599
Structure of Arrays age sum: 50.3258
For 2000 bytes of extra data in Person struct: SoA is 2.04 times faster than AoS
For 2000 bytes of extra data in Person struct: SoA is 2.30 times faster than scattered array
Scattered heap allocations age sum: 50.334999
Arrays of Structures age sum: 49.749599
Structure of Arrays age sum: 49.890598
For 3000 bytes of extra data in Person struct: SoA is 3.13 times faster than AoS
For 3000 bytes of extra data in Person struct: SoA is 3.53 times faster than scattered array
```

## Program output with `-o:speed` on my computer:
```
Benchmark: Using thightly packed arrays over separate heap allocations
Scattered array age sum: 49.6236
Tight array age sum: 50.0718
Cache friendly method is 21.84 times faster

Benchmark: SoA vs AoS vs separate heap allocs
Scattered heap allocations age sum: 49.8782
Arrays of Structures age sum: 50.120899
Structure of Arrays age sum: 49.860699
For 0 bytes of extra data in Person struct: SoA is 3.31 times faster than AoS
For 0 bytes of extra data in Person struct: SoA is 37.52 times faster than scattered array
Scattered heap allocations age sum: 49.351398
Arrays of Structures age sum: 50.107899
Structure of Arrays age sum: 49.905998
For 2 bytes of extra data in Person struct: SoA is 1.53 times faster than AoS
For 2 bytes of extra data in Person struct: SoA is 28.35 times faster than scattered array
Scattered heap allocations age sum: 50.021
Arrays of Structures age sum: 49.8293
Structure of Arrays age sum: 49.9776
For 4 bytes of extra data in Person struct: SoA is 2.02 times faster than AoS
For 4 bytes of extra data in Person struct: SoA is 36.53 times faster than scattered array
Scattered heap allocations age sum: 49.9576
Arrays of Structures age sum: 49.8389
Structure of Arrays age sum: 49.8904
For 8 bytes of extra data in Person struct: SoA is 1.97 times faster than AoS
For 8 bytes of extra data in Person struct: SoA is 37.41 times faster than scattered array
Scattered heap allocations age sum: 50.338699
Arrays of Structures age sum: 49.6118
Structure of Arrays age sum: 49.953899
For 16 bytes of extra data in Person struct: SoA is 5.66 times faster than AoS
For 16 bytes of extra data in Person struct: SoA is 11.20 times faster than scattered array
Scattered heap allocations age sum: 50.5073
Arrays of Structures age sum: 49.9942
Structure of Arrays age sum: 50.217098
For 32 bytes of extra data in Person struct: SoA is 6.30 times faster than AoS
For 32 bytes of extra data in Person struct: SoA is 8.89 times faster than scattered array
Scattered heap allocations age sum: 49.6749
Arrays of Structures age sum: 49.7155
Structure of Arrays age sum: 50.5181
For 64 bytes of extra data in Person struct: SoA is 11.79 times faster than AoS
For 64 bytes of extra data in Person struct: SoA is 13.84 times faster than scattered array
Scattered heap allocations age sum: 49.835999
Arrays of Structures age sum: 49.9238
Structure of Arrays age sum: 50.5558
For 128 bytes of extra data in Person struct: SoA is 15.61 times faster than AoS
For 128 bytes of extra data in Person struct: SoA is 15.82 times faster than scattered array
Scattered heap allocations age sum: 49.817799
Arrays of Structures age sum: 50.087799
Structure of Arrays age sum: 49.9001
For 256 bytes of extra data in Person struct: SoA is 9.90 times faster than AoS
For 256 bytes of extra data in Person struct: SoA is 8.89 times faster than scattered array
Scattered heap allocations age sum: 50.0288
Arrays of Structures age sum: 50.326698
Structure of Arrays age sum: 49.9231
For 512 bytes of extra data in Person struct: SoA is 13.19 times faster than AoS
For 512 bytes of extra data in Person struct: SoA is 13.45 times faster than scattered array
Scattered heap allocations age sum: 49.6775
Arrays of Structures age sum: 49.788898
Structure of Arrays age sum: 49.857399
For 1024 bytes of extra data in Person struct: SoA is 14.07 times faster than AoS
For 1024 bytes of extra data in Person struct: SoA is 15.30 times faster than scattered array
Scattered heap allocations age sum: 50.021
Arrays of Structures age sum: 50.4971
Structure of Arrays age sum: 49.997
For 1500 bytes of extra data in Person struct: SoA is 9.27 times faster than AoS
For 1500 bytes of extra data in Person struct: SoA is 9.75 times faster than scattered array
Scattered heap allocations age sum: 50.343498
Arrays of Structures age sum: 50.1978
Structure of Arrays age sum: 50.3144
For 2000 bytes of extra data in Person struct: SoA is 17.50 times faster than AoS
For 2000 bytes of extra data in Person struct: SoA is 17.79 times faster than scattered array
Scattered heap allocations age sum: 49.3885
Arrays of Structures age sum: 50.2242
Structure of Arrays age sum: 50.2564
For 3000 bytes of extra data in Person struct: SoA is 26.96 times faster than AoS
For 3000 bytes of extra data in Person struct: SoA is 28.48 times faster than scattered array
```
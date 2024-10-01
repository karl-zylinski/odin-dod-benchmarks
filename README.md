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
Scattered array age sum: 50.2905
Tight array age sum: 50.176998
Cache friendly method is 3.83 times faster

Benchmark: SoA vs AoS vs separate heap allocs
Arrays of Structures age sum: 50.057598
Arrays of Structures age sum: 50.023899
Structure of Arrays age sum: 50.229198
For 0 bytes of extra data in Person struct: SoA is 1.05 times faster than AoS
For 0 bytes of extra data in Person struct: SoA is 4.04 times faster than scattered array
Arrays of Structures age sum: 49.9939
Arrays of Structures age sum: 49.7676
Structure of Arrays age sum: 50.4071
For 2 bytes of extra data in Person struct: SoA is 1.04 times faster than AoS
For 2 bytes of extra data in Person struct: SoA is 4.00 times faster than scattered array
Arrays of Structures age sum: 49.719898
Arrays of Structures age sum: 50.0553
Structure of Arrays age sum: 49.717098
For 4 bytes of extra data in Person struct: SoA is 1.04 times faster than AoS
For 4 bytes of extra data in Person struct: SoA is 4.02 times faster than scattered array
Arrays of Structures age sum: 49.8356
Arrays of Structures age sum: 49.5928
Structure of Arrays age sum: 50.1024
For 8 bytes of extra data in Person struct: SoA is 1.04 times faster than AoS
For 8 bytes of extra data in Person struct: SoA is 3.97 times faster than scattered array
Arrays of Structures age sum: 49.8143
Arrays of Structures age sum: 50.1234
Structure of Arrays age sum: 50.3436
For 16 bytes of extra data in Person struct: SoA is 1.07 times faster than AoS
For 16 bytes of extra data in Person struct: SoA is 1.77 times faster than scattered array
Arrays of Structures age sum: 50.2144
Arrays of Structures age sum: 49.960999
Structure of Arrays age sum: 49.9361
For 32 bytes of extra data in Person struct: SoA is 1.20 times faster than AoS
For 32 bytes of extra data in Person struct: SoA is 1.82 times faster than scattered array
Arrays of Structures age sum: 49.9528
Arrays of Structures age sum: 49.970798
Structure of Arrays age sum: 50.236698
For 64 bytes of extra data in Person struct: SoA is 1.54 times faster than AoS
For 64 bytes of extra data in Person struct: SoA is 1.93 times faster than scattered array
Arrays of Structures age sum: 49.9719
Arrays of Structures age sum: 49.7925
Structure of Arrays age sum: 49.671299
For 128 bytes of extra data in Person struct: SoA is 1.88 times faster than AoS
For 128 bytes of extra data in Person struct: SoA is 2.01 times faster than scattered array
Arrays of Structures age sum: 49.653
Arrays of Structures age sum: 50.0376
Structure of Arrays age sum: 49.663898
For 256 bytes of extra data in Person struct: SoA is 1.96 times faster than AoS
For 256 bytes of extra data in Person struct: SoA is 2.09 times faster than scattered array
Arrays of Structures age sum: 49.79
Arrays of Structures age sum: 49.770599
Structure of Arrays age sum: 50.108898
For 512 bytes of extra data in Person struct: SoA is 1.85 times faster than AoS
For 512 bytes of extra data in Person struct: SoA is 2.05 times faster than scattered array
Arrays of Structures age sum: 50.026798
Arrays of Structures age sum: 49.7939
Structure of Arrays age sum: 50.2975
For 1024 bytes of extra data in Person struct: SoA is 2.37 times faster than AoS
For 1024 bytes of extra data in Person struct: SoA is 2.43 times faster than scattered array
Arrays of Structures age sum: 50.3848
Arrays of Structures age sum: 49.7691
Structure of Arrays age sum: 49.6003
For 1500 bytes of extra data in Person struct: SoA is 2.42 times faster than AoS
For 1500 bytes of extra data in Person struct: SoA is 2.70 times faster than scattered array
Arrays of Structures age sum: 49.8974
Arrays of Structures age sum: 49.910099
Structure of Arrays age sum: 49.8688
For 2000 bytes of extra data in Person struct: SoA is 2.08 times faster than AoS
For 2000 bytes of extra data in Person struct: SoA is 2.24 times faster than scattered array
Arrays of Structures age sum: 50.1544
Arrays of Structures age sum: 49.648998
Structure of Arrays age sum: 50.249298
For 3000 bytes of extra data in Person struct: SoA is 3.13 times faster than AoS
For 3000 bytes of extra data in Person struct: SoA is 3.57 times faster than scattered array
```

## Program output with `-o:speed` on my computer:
```
Benchmark: Using thightly packed arrays over separate heap allocations
Scattered array age sum: 49.899399
Tight array age sum: 49.178398
Cache friendly method is 21.70 times faster

Benchmark: SoA vs AoS vs separate heap allocs
Arrays of Structures age sum: 49.9972
Arrays of Structures age sum: 49.4872
Structure of Arrays age sum: 49.9346
For 0 bytes of extra data in Person struct: SoA is 1.35 times faster than AoS
For 0 bytes of extra data in Person struct: SoA is 26.85 times faster than scattered array
Arrays of Structures age sum: 49.5493
Arrays of Structures age sum: 50.322399
Structure of Arrays age sum: 50.0424
For 2 bytes of extra data in Person struct: SoA is 2.07 times faster than AoS
For 2 bytes of extra data in Person struct: SoA is 39.02 times faster than scattered array
Arrays of Structures age sum: 50.516998
Arrays of Structures age sum: 50.205799
Structure of Arrays age sum: 50.260399
For 4 bytes of extra data in Person struct: SoA is 3.16 times faster than AoS
For 4 bytes of extra data in Person struct: SoA is 38.24 times faster than scattered array
Arrays of Structures age sum: 49.675999
Arrays of Structures age sum: 50.4522
Structure of Arrays age sum: 49.525299
For 8 bytes of extra data in Person struct: SoA is 2.59 times faster than AoS
For 8 bytes of extra data in Person struct: SoA is 30.29 times faster than scattered array
Arrays of Structures age sum: 50.3852
Arrays of Structures age sum: 49.930599
Structure of Arrays age sum: 50.182899
For 16 bytes of extra data in Person struct: SoA is 3.01 times faster than AoS
For 16 bytes of extra data in Person struct: SoA is 7.62 times faster than scattered array
Arrays of Structures age sum: 50.5186
Arrays of Structures age sum: 50.172
Structure of Arrays age sum: 50.448299
For 32 bytes of extra data in Person struct: SoA is 6.54 times faster than AoS
For 32 bytes of extra data in Person struct: SoA is 8.55 times faster than scattered array
Arrays of Structures age sum: 50.5367
Arrays of Structures age sum: 50.335899
Structure of Arrays age sum: 49.7877
For 64 bytes of extra data in Person struct: SoA is 12.18 times faster than AoS
For 64 bytes of extra data in Person struct: SoA is 14.70 times faster than scattered array
Arrays of Structures age sum: 49.6104
Arrays of Structures age sum: 49.7587
Structure of Arrays age sum: 49.8698
For 128 bytes of extra data in Person struct: SoA is 11.19 times faster than AoS
For 128 bytes of extra data in Person struct: SoA is 10.19 times faster than scattered array
Arrays of Structures age sum: 50.359699
Arrays of Structures age sum: 49.599899
Structure of Arrays age sum: 50.4831
For 256 bytes of extra data in Person struct: SoA is 15.99 times faster than AoS
For 256 bytes of extra data in Person struct: SoA is 15.34 times faster than scattered array
Arrays of Structures age sum: 49.9085
Arrays of Structures age sum: 49.5069
Structure of Arrays age sum: 50.237999
For 512 bytes of extra data in Person struct: SoA is 14.48 times faster than AoS
For 512 bytes of extra data in Person struct: SoA is 14.64 times faster than scattered array
Arrays of Structures age sum: 49.8431
Arrays of Structures age sum: 49.9505
Structure of Arrays age sum: 50.076698
For 1024 bytes of extra data in Person struct: SoA is 7.32 times faster than AoS
For 1024 bytes of extra data in Person struct: SoA is 7.43 times faster than scattered array
Arrays of Structures age sum: 49.7733
Arrays of Structures age sum: 50.3419
Structure of Arrays age sum: 49.8344
For 1500 bytes of extra data in Person struct: SoA is 14.70 times faster than AoS
For 1500 bytes of extra data in Person struct: SoA is 16.07 times faster than scattered array
Arrays of Structures age sum: 50.5232
Arrays of Structures age sum: 50.387699
Structure of Arrays age sum: 49.9952
For 2000 bytes of extra data in Person struct: SoA is 21.02 times faster than AoS
For 2000 bytes of extra data in Person struct: SoA is 22.40 times faster than scattered array
Arrays of Structures age sum: 49.4492
Arrays of Structures age sum: 50.2793
Structure of Arrays age sum: 49.502399
For 3000 bytes of extra data in Person struct: SoA is 27.28 times faster than AoS
For 3000 bytes of extra data in Person struct: SoA is 26.34 times faster than scattered array
```
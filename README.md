These benchmarks were written to provide examples of how different memory layouts can affect performance.

Note that benchmarks are never an absolute truth. Depending on the data access patterns of tight loops the performance characteristics can change a lot. This is simply meant to show some techniques that are faster in certain cases.

`tight_arrays` contains an example of how separately heap allocating array elements vs keeping them within an array can affect performance. Note that I fudge the memory addresses of where the separate heap allocations end up by allocating random amounts of data before each element. This simulates the program running for a while and elements being added every now and the as opposed to all in one go.

`soa` contains examples of how the performance can differ for arrays that use:
- Structure of Arrays
- Array of Structures
- Separately heap allocated elements

Note that in the `soa` benchmark the benchmark is re-run several times with bigger and bigger amounts of "extra data" in each array element.

## Running the tests

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
Benchmark: Iterating tightly packed arrays vs arrays with separately heap allocated elements
--------------------------------------------------------------------------------------------
Scattered array age sum: 51.180599
Tight array age sum: 50.1008
Cache friendly method is 3.85 times faster

Benchmark: Iterating arrays that use SoA vs AoS vs separately heap allocated elements
-------------------------------------------------------------------------------------
For 0 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.4728
Arrays of Structures age sum: 50.276199
Structure of Arrays age sum: 50.411098
SoA is 1.06 times faster than AoS
SoA is 4.05 times faster than scattered array

For 2 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.004
Arrays of Structures age sum: 50.1939
Structure of Arrays age sum: 50.202
SoA is 1.04 times faster than AoS
SoA is 4.03 times faster than scattered array

For 4 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.241299
Arrays of Structures age sum: 50.234798
Structure of Arrays age sum: 50.0829
SoA is 1.04 times faster than AoS
SoA is 3.99 times faster than scattered array

For 8 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.8054
Arrays of Structures age sum: 49.2605
Structure of Arrays age sum: 50.0765
SoA is 1.04 times faster than AoS
SoA is 4.13 times faster than scattered array

For 16 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.9506
Arrays of Structures age sum: 49.9188
Structure of Arrays age sum: 49.814499
SoA is 1.07 times faster than AoS
SoA is 1.79 times faster than scattered array

For 32 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.1576
Arrays of Structures age sum: 50.088299
Structure of Arrays age sum: 49.8412
SoA is 1.21 times faster than AoS
SoA is 1.80 times faster than scattered array

For 64 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.7724
Arrays of Structures age sum: 50.048
Structure of Arrays age sum: 50.2673
SoA is 1.48 times faster than AoS
SoA is 1.98 times faster than scattered array

For 128 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.4217
Arrays of Structures age sum: 50.2882
Structure of Arrays age sum: 49.923698
SoA is 1.99 times faster than AoS
SoA is 1.98 times faster than scattered array

For 256 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.5131
Arrays of Structures age sum: 50.043598
Structure of Arrays age sum: 50.430599
SoA is 1.92 times faster than AoS
SoA is 2.06 times faster than scattered array

For 512 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.0951
Arrays of Structures age sum: 49.9863
Structure of Arrays age sum: 50.144798
SoA is 1.87 times faster than AoS
SoA is 2.07 times faster than scattered array

For 1024 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.072498
Arrays of Structures age sum: 49.411098
Structure of Arrays age sum: 49.9305
SoA is 2.23 times faster than AoS
SoA is 2.45 times faster than scattered array

For 1500 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.891899
Arrays of Structures age sum: 49.5755
Structure of Arrays age sum: 50.1118
SoA is 2.42 times faster than AoS
SoA is 2.70 times faster than scattered array

For 2000 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.4119
Arrays of Structures age sum: 49.7807
Structure of Arrays age sum: 50.178699
SoA is 2.06 times faster than AoS
SoA is 2.23 times faster than scattered array

For 3000 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.9331
Arrays of Structures age sum: 49.688099
Structure of Arrays age sum: 49.9849
SoA is 3.18 times faster than AoS
SoA is 3.52 times faster than scattered array
```

## Program output with `-o:speed` on my computer:
```
Benchmark: Iterating tightly packed arrays vs arrays with separately heap allocated elements
--------------------------------------------------------------------------------------------
Scattered array age sum: 49.313599
Tight array age sum: 50.057899
Cache friendly method is 20.86 times faster

Benchmark: Iterating arrays that use SoA vs AoS vs separately heap allocated elements
-------------------------------------------------------------------------------------
For 0 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.8903
Arrays of Structures age sum: 49.5387
Structure of Arrays age sum: 49.837399
SoA is 2.79 times faster than AoS
SoA is 40.94 times faster than scattered array

For 2 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.1248
Arrays of Structures age sum: 50.2579
Structure of Arrays age sum: 50.1211
SoA is 1.38 times faster than AoS
SoA is 25.59 times faster than scattered array

For 4 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.201599
Arrays of Structures age sum: 49.722599
Structure of Arrays age sum: 49.8646
SoA is 2.01 times faster than AoS
SoA is 39.80 times faster than scattered array

For 8 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.592499
Arrays of Structures age sum: 49.8403
Structure of Arrays age sum: 49.9879
SoA is 2.00 times faster than AoS
SoA is 37.28 times faster than scattered array

For 16 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.95
Arrays of Structures age sum: 50.0772
Structure of Arrays age sum: 49.5349
SoA is 5.42 times faster than AoS
SoA is 11.48 times faster than scattered array

For 32 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.712799
Arrays of Structures age sum: 49.5772
Structure of Arrays age sum: 50.045799
SoA is 5.43 times faster than AoS
SoA is 8.95 times faster than scattered array

For 64 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.1566
Arrays of Structures age sum: 49.986599
Structure of Arrays age sum: 49.783699
SoA is 11.76 times faster than AoS
SoA is 16.73 times faster than scattered array

For 128 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.0602
Arrays of Structures age sum: 50.0028
Structure of Arrays age sum: 49.602699
SoA is 15.87 times faster than AoS
SoA is 14.99 times faster than scattered array

For 256 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.8921
Arrays of Structures age sum: 50.0311
Structure of Arrays age sum: 50.1157
SoA is 7.50 times faster than AoS
SoA is 8.00 times faster than scattered array

For 512 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.063
Arrays of Structures age sum: 49.9266
Structure of Arrays age sum: 50.3134
SoA is 13.31 times faster than AoS
SoA is 15.57 times faster than scattered array

For 1024 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.088299
Arrays of Structures age sum: 50.061798
Structure of Arrays age sum: 50.102699
SoA is 15.54 times faster than AoS
SoA is 14.73 times faster than scattered array

For 1500 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.7318
Arrays of Structures age sum: 49.972698
Structure of Arrays age sum: 49.6439
SoA is 8.12 times faster than AoS
SoA is 8.70 times faster than scattered array

For 2000 bytes of extra data in each array element:
Scattered heap allocations age sum: 49.905899
Arrays of Structures age sum: 50.3902
Structure of Arrays age sum: 49.914398
SoA is 22.79 times faster than AoS
SoA is 22.57 times faster than scattered array

For 3000 bytes of extra data in each array element:
Scattered heap allocations age sum: 50.0609
Arrays of Structures age sum: 49.6073
Structure of Arrays age sum: 48.917599
SoA is 29.32 times faster than AoS
SoA is 27.61 times faster than scattered array
```
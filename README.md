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
Benchmark: Iterating tightly packed arrays vs arrays with separately heap allocated elements
--------------------------------------------------------------------------------------------
Scattered array age sum: 50.4268
Tight array age sum: 50.0145
Cache friendly method is 4.03 times faster

Benchmark: Iterating arrays that use SoA vs AoS vs separately heap allocated elements
-------------------------------------------------------------------------------------
For 0 bytes of extra data
Scattered heap allocations age sum: 49.893398
Arrays of Structures age sum: 50.191399
Structure of Arrays age sum: 49.8144
SoA is 1.05 times faster than AoS
SoA is 4.16 times faster than scattered array

For 2 bytes of extra data
Scattered heap allocations age sum: 50.224998
Arrays of Structures age sum: 49.9066
Structure of Arrays age sum: 49.5145
SoA is 1.04 times faster than AoS
SoA is 4.12 times faster than scattered array

For 4 bytes of extra data
Scattered heap allocations age sum: 49.851799
Arrays of Structures age sum: 50.3936
Structure of Arrays age sum: 49.837898
SoA is 0.99 times faster than AoS
SoA is 3.85 times faster than scattered array

For 8 bytes of extra data
Scattered heap allocations age sum: 49.8167
Arrays of Structures age sum: 50.3918
Structure of Arrays age sum: 49.960499
SoA is 1.06 times faster than AoS
SoA is 4.03 times faster than scattered array

For 16 bytes of extra data
Scattered heap allocations age sum: 49.773399
Arrays of Structures age sum: 49.745499
Structure of Arrays age sum: 50.3009
SoA is 1.07 times faster than AoS
SoA is 1.76 times faster than scattered array

For 32 bytes of extra data
Scattered heap allocations age sum: 49.913799
Arrays of Structures age sum: 50.1954
Structure of Arrays age sum: 50.109299
SoA is 1.20 times faster than AoS
SoA is 1.82 times faster than scattered array

For 64 bytes of extra data
Scattered heap allocations age sum: 49.7849
Arrays of Structures age sum: 49.8964
Structure of Arrays age sum: 50.1188
SoA is 1.53 times faster than AoS
SoA is 2.20 times faster than scattered array

For 128 bytes of extra data
Scattered heap allocations age sum: 49.4676
Arrays of Structures age sum: 49.8643
Structure of Arrays age sum: 49.9424
SoA is 1.83 times faster than AoS
SoA is 2.11 times faster than scattered array

For 256 bytes of extra data
Scattered heap allocations age sum: 50.1217
Arrays of Structures age sum: 49.9607
Structure of Arrays age sum: 49.960098
SoA is 1.86 times faster than AoS
SoA is 2.13 times faster than scattered array

For 512 bytes of extra data
Scattered heap allocations age sum: 49.8618
Arrays of Structures age sum: 49.8628
Structure of Arrays age sum: 49.486599
SoA is 1.86 times faster than AoS
SoA is 2.03 times faster than scattered array

For 1024 bytes of extra data
Scattered heap allocations age sum: 50.0315
Arrays of Structures age sum: 49.928699
Structure of Arrays age sum: 49.7
SoA is 2.23 times faster than AoS
SoA is 2.40 times faster than scattered array

For 1500 bytes of extra data
Scattered heap allocations age sum: 49.6057
Arrays of Structures age sum: 50.0073
Structure of Arrays age sum: 50.1161
SoA is 2.41 times faster than AoS
SoA is 2.67 times faster than scattered array

For 2000 bytes of extra data
Scattered heap allocations age sum: 49.8314
Arrays of Structures age sum: 49.7463
Structure of Arrays age sum: 50.136799
SoA is 2.06 times faster than AoS
SoA is 2.22 times faster than scattered array

For 3000 bytes of extra data
Scattered heap allocations age sum: 50.132
Arrays of Structures age sum: 49.8506
Structure of Arrays age sum: 49.911598
SoA is 3.21 times faster than AoS
SoA is 3.59 times faster than scattered array
```

## Program output with `-o:speed` on my computer:
```
Benchmark: Iterating tightly packed arrays vs arrays with separately heap allocated elements
--------------------------------------------------------------------------------------------
Scattered array age sum: 50.0737
Tight array age sum: 49.5336
Cache friendly method is 21.38 times faster

Benchmark: Iterating arrays that use SoA vs AoS vs separately heap allocated elements
-------------------------------------------------------------------------------------
For 0 bytes of extra data
Scattered heap allocations age sum: 50.2993
Arrays of Structures age sum: 49.5842
Structure of Arrays age sum: 49.941299
SoA is 2.20 times faster than AoS
SoA is 27.07 times faster than scattered array

For 2 bytes of extra data
Scattered heap allocations age sum: 49.9548
Arrays of Structures age sum: 49.989399
Structure of Arrays age sum: 50.0068
SoA is 1.50 times faster than AoS
SoA is 27.59 times faster than scattered array

For 4 bytes of extra data
Scattered heap allocations age sum: 49.843399
Arrays of Structures age sum: 50.3287
Structure of Arrays age sum: 49.978699
SoA is 2.29 times faster than AoS
SoA is 38.14 times faster than scattered array

For 8 bytes of extra data
Scattered heap allocations age sum: 49.507
Arrays of Structures age sum: 50.066898
Structure of Arrays age sum: 50.0061
SoA is 3.09 times faster than AoS
SoA is 36.29 times faster than scattered array

For 16 bytes of extra data
Scattered heap allocations age sum: 50.0601
Arrays of Structures age sum: 50.2448
Structure of Arrays age sum: 50.059799
SoA is 3.14 times faster than AoS
SoA is 7.87 times faster than scattered array

For 32 bytes of extra data
Scattered heap allocations age sum: 49.9957
Arrays of Structures age sum: 50.5721
Structure of Arrays age sum: 50.1633
SoA is 7.68 times faster than AoS
SoA is 13.28 times faster than scattered array

For 64 bytes of extra data
Scattered heap allocations age sum: 50.32
Arrays of Structures age sum: 49.7187
Structure of Arrays age sum: 50.0091
SoA is 12.18 times faster than AoS
SoA is 14.58 times faster than scattered array

For 128 bytes of extra data
Scattered heap allocations age sum: 50.372898
Arrays of Structures age sum: 49.874699
Structure of Arrays age sum: 50.1076
SoA is 10.64 times faster than AoS
SoA is 10.28 times faster than scattered array

For 256 bytes of extra data
Scattered heap allocations age sum: 49.5601
Arrays of Structures age sum: 49.970699
Structure of Arrays age sum: 50.021999
SoA is 14.24 times faster than AoS
SoA is 14.65 times faster than scattered array

For 512 bytes of extra data
Scattered heap allocations age sum: 49.6566
Arrays of Structures age sum: 50.1543
Structure of Arrays age sum: 49.698799
SoA is 15.29 times faster than AoS
SoA is 13.63 times faster than scattered array

For 1024 bytes of extra data
Scattered heap allocations age sum: 49.8326
Arrays of Structures age sum: 50.203899
Structure of Arrays age sum: 50.2854
SoA is 7.66 times faster than AoS
SoA is 7.85 times faster than scattered array

For 1500 bytes of extra data
Scattered heap allocations age sum: 49.599499
Arrays of Structures age sum: 49.341499
Structure of Arrays age sum: 50.291599
SoA is 15.24 times faster than AoS
SoA is 16.55 times faster than scattered array

For 2000 bytes of extra data
Scattered heap allocations age sum: 50.3217
Arrays of Structures age sum: 50.1679
Structure of Arrays age sum: 49.851398
SoA is 20.39 times faster than AoS
SoA is 21.56 times faster than scattered array

For 3000 bytes of extra data
Scattered heap allocations age sum: 50.0918
Arrays of Structures age sum: 49.5054
Structure of Arrays age sum: 50.035099
SoA is 27.28 times faster than AoS
SoA is 28.28 times faster than scattered array
```
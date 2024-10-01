package odin_do_examples

import "core:fmt"
import "tight_arrays"
import "soa"

main :: proc() {
    fmt.println("Benchmark: Iterating tightly packed arrays vs arrays with separately heap allocated elements")
    fmt.println("--------------------------------------------------------------------------------------------")
    tight_arrays.main()

    fmt.println("")
    fmt.println("Benchmark: Iterating arrays that use SoA vs AoS vs separately heap allocated elements")
    fmt.println("-------------------------------------------------------------------------------------")
    soa.main()
}
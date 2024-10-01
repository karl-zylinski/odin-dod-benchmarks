package odin_do_examples

import "core:fmt"
import "tight_arrays"
import "soa"

main :: proc() {
    fmt.println("Benchmark: Using thightly packed arrays over separate heap allocations")
    tight_arrays.main()

    fmt.println("")
    fmt.println("Benchmark: SoA vs AoS vs separate heap allocs")
    soa.main()
}
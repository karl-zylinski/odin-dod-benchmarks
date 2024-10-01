package dod_tests

import fmt "core:fmt"
import "core:math/rand"
import "core:mem"
import "core:time"

Person :: struct {
	health: int,
	age: int,
}

NUM_ELEMS :: 10000
NUM_TEST_ITERS :: 10

make_person :: proc() -> Person {
	health := int(rand.int31_max(101))
	age := int(rand.int31_max(101))

	return {
		health = health,
		age = age,
	}
}

// Test with array where each element is separately heap allocated, scattering
// the elements in memory.
benchmark_scattered_array :: proc() -> f64 {
	people: [dynamic]^Person

	for _ in 0..<NUM_ELEMS {
		// This spreads out the elements more in memory. Allocating all these
		// heap allocs in one go in an unfair advantage because if you add
		// elements over time they don't tend to be very close in memory.
		for _ in 0 ..< 100 {
			_, _ = mem.alloc(rand.int_max(8)+8)
		}

		p := new(Person)
		p^ = make_person()
		append(&people, p)
	}

	age_sum: int
	start := time.now()
	for i in 0..<NUM_TEST_ITERS {
		for &p in people {
			age_sum += p.age
		}
	}
	end := time.now()
	fmt.println("Scattered array age sum:", f32(age_sum)/(NUM_TEST_ITERS*NUM_ELEMS))

	return time.duration_milliseconds(time.diff(start, end)) 
}

benchmark_tight_array :: proc() -> f64 {
	people: [dynamic]Person

	for i in 0..<NUM_ELEMS {
		p := make_person()
		append(&people, p)
	}

	age_sum: int
	start := time.now()
	for i in 0..<NUM_TEST_ITERS {
		for &p in people {
			age_sum += p.age
		}
	}
	end := time.now()
	fmt.println("Tight array age sum:", f32(age_sum)/(NUM_TEST_ITERS*NUM_ELEMS))
	
	return time.duration_milliseconds(time.diff(start, end)) 
}

main :: proc() {
	time_scattered := benchmark_scattered_array()
	time_tight := benchmark_tight_array()
	fmt.printfln("Cache friendly method is %.2f times faster", time_scattered/time_tight)
}

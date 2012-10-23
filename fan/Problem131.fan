class Problem131 {
  Void main() {
    res := solve(1_000_000 - 1)
    echo(res)
  }

  Int solve(Int max) {
    cnt := 0
    primes := primes(max)
    for (l := 1; 3 * l * l + 3 * l + 1 <= max; l++) {
      if (primes[3 * l * l + 3 * l + 1]) cnt++
    }
    return cnt
  }

  Bool[] primes(Int max) {
    Bool[] sieve := (0..max).map { true }
    sieve[0] = false
    sieve[1] = false
    for (d := 2; d <= max; d++) {
      if (sieve[d]) {
        k := d * 2
        while (k <= max) {
          sieve[k] = false
          k += d
        }
      }
    }
    return sieve
  }
}

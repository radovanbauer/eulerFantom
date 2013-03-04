class Problem134 {
  Void main() {
    res := solve(1_000_000)
    echo(res)
  }

  Int solve(Int max) {
    primes := primes(max * 2)
    sum := 0
    for (i := 0; primes[i] <= max; i++) {
      p1 := primes[i]
      p2 := primes[i + 1]
      if (p1 < 5) continue
      n := 10.pow(p1.toStr.size)
      ntot := n / 10 * 4
      s := ((powMod(p2, ntot - 1, n) * p1) % n) * p2
      sum += s
    }
    return sum
  }

  Int powMod(Int base, Int exp, Int mod) {
    if (exp == 0) return 1
    p := powMod(base, exp / 2, mod)
    return exp % 2 == 0 ? (p * p) % mod : (p * p * base) % mod
  }

  Int[] primes(Int max) {
    Int[] primes := [,]
    Bool[] sieve := (0..max).map { false }
    for (d := 2; d <= max; d++) {
      if (!sieve[d]) {
        primes.add(d)
        k := d * 2
        while (k <= max) {
          sieve[k] = true
          k += d
        }
      }
    }
    return primes
  }
}

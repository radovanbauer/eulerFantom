class Problem124 {
  Void main() {
    res := solve(100_000, 10_000)
    echo(res)
  }

  Int solve(Int n, Int k) {
    primes := primes(n)
    Int[][] rads := (1..n).map { [it, rad(it, primes)] }
    rads.sort |a, b| { a[1] <=> b[1] != 0 ? a[1] <=> b[1] : a[0] <=> b[0] }
    return rads[k - 1][0]
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

  Int rad(Int n, Int[] primes) {
    res := 1
    p := 0
    while (n > 1) {
      if (n % primes[p] == 0) {
        res *= primes[p]
        while (n % primes[p] == 0) {
          n /= primes[p]
        }
      }
      p++
    }
    return res
  }
}

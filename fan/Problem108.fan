class Problem108 {
  Void main() {
    primes := primes(1_000_000)
    for (n := 1;; n++) {
      if (divCnt(n * n, primes) > 1999) {
        echo(n)
        return
      }
    }
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

  Int divCnt(Int n, Int[] primes) {
    res := 1
    p := 0
    while (n > 1) {
      cnt := 0
      while (n % primes[p] == 0) {
        n /= primes[p]
        cnt++
      }
      res *= cnt + 1
      p++
    }
    return res
  }
}

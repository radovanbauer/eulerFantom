class Problem87 {
  Void main() {
    max := 50_000_000
    found := [,]
    primes1 := primes(max.toFloat.pow(1F / 2F).ceil.toInt)
    primes2 := primes(max.toFloat.pow(1F / 3F).ceil.toInt)
    primes3 := primes(max.toFloat.pow(1F / 4F).ceil.toInt)
    primes1.each |a| {
      primes2.each |b| {
        primes3.each |c| {
          sum := a * a + b * b * b + c * c * c * c
          if (sum < max) found.add(sum)
        }
      }
    }
    res := found.unique.size
    echo(res)
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

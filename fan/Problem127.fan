class Problem127 {
  Void main() {
    res := solve(120_000 - 1)
    echo(res)
  }

  Int solve(Int max) {
    primes := primes(max)
    Int[] rads := (0..max).toList.map { rad(it, primes) }
    Int[][] radsSorted := rads.map |rad, idx| { [rad, idx] }
        .sort |Int[] a, Int[] b -> Int| { a[0] <=> b[0] }
    Int sum := 0
    for (c := 3; c <= max; c++) {
      for (i := 0; radsSorted[i][0] <= c / (2 * rads[c]); i++) {
        a := radsSorted[i][1]
        b := c - a
        if (a < b && b < c && rads[a] * rads[b] * rads[c] < c && gcd(a, b) == 1) {
          sum += c
        }
      }
    }
    return sum
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

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

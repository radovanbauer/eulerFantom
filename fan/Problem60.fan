class Problem60 {
  Void main() {
    maxPrime := 30_000
    Int[] primes := (1..maxPrime).toList.findAll { isPrime(it) }
    res := Int.maxVal
    for (i1 := 0; i1 < primes.size; i1++) {
      p1 := primes[i1]
      if (p1 * 5 >= res) break
      for (i2 := i1 + 1; i2 < primes.size; i2++) {
        p2 := primes[i2]
        if (p1 + p2 * 4 >= res) break
        if (!remarkable(p1, p2)) continue
        for (i3 := i2 + 1; i3 < primes.size; i3++) {
          p3 := primes[i3]
          if (p1 + p2 + p3 * 3 >= res) break
          if (!([p1, p2].all { remarkable(p3, it) })) continue
          for (i4 := i3 + 1; i4 < primes.size; i4++) {
            p4 := primes[i4]
            if (p1 + p2 + p3 + p4 * 2 >= res) break
            if (!([p1, p2, p3].all { remarkable(p4, it) })) continue
            for (i5 := i4 + 1; i5 < primes.size; i5++) {
              p5 := primes[i5]
              if (p1 + p2 + p3 + p4 + p5 >= res) break
              if (!([p1, p2, p3, p4].all { remarkable(p5, it) })) continue
              res = p1 + p2 + p3 + p4 + p5
            }
          }
        }
      }
    }
    if (res > maxPrime) throw Err()
    echo(res)
  }

  Bool remarkable(Int p1, Int p2) {
    return isPrime((p1.toStr + p2.toStr).toInt) && isPrime((p2.toStr + p1.toStr).toInt)
  }

  Int:Bool primeCache := [:]

  Bool isPrime(Int n) {
    if (n <= 1) return false
    if (primeCache.containsKey(n)) return primeCache[n]
    res := true
    for (d := 2; d * d <= n; d++) {
      if (n % d == 0) {
        res = false
        break
      }
    }
    primeCache[n] = res
    return res
  }
}

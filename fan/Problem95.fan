class Problem95 { 
  Void main() {
    max := 1_000_000
    maxSeqSize := 1
    res := Int.maxVal
    for (i := 1; i <= max; i++) {
      seq := [i]
      while (true) {
        next := sumOfProperDivisors(seq.last)
        if (next > max) {
          break
        }
        if (seq.contains(next)) {
          if (next == seq.first && seq.size > maxSeqSize) {
            maxSeqSize = seq.size
            res = seq.min
          }
          break
        }
        seq.add(next)
      }
    }
    echo(res)
  }

  Int:Int cache := [:]

  Int sumOfProperDivisors(Int n) {
    if (cache.containsKey(n)) return cache[n]
    res := sum(properDivisors(n))
    cache[n] = res
    return res
  }

  Int[] properDivisors(Int n) {
    return divisors(n).findAll { it < n }
  }

  Int[] divisors(Int n) {
    res := [,]
    for (i := 1; i * i <= n; i++) {
      if (n % i == 0) {
        res.add(i)
        if (i != n / i) {
          res.add(n / i)
        }
      }
    }
    return res
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

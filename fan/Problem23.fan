class Problem23 {
  Void main() {
    Int[] abundant := (1..28123).toList.findAll { isAbundant(it) }
    Bool[] abundantSums := [,] { fill(false, 28123 + 1) }
    abundant.each |a1| {
      abundant.each |a2| {
        if (a1 + a2 < abundantSums.size) {
          abundantSums[a1 + a2] = true
        }
      }
    }
    res := 0
    abundantSums.each |val, idx| {
      if (!val) res += idx
    }
    echo(res)
  }

  Bool isAbundant(Int n) {
    return sum(properDivisors(n)) > n
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
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
}

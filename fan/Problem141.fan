class Problem141 {
  Void main() {
    max := 10.pow(12)
    ns := [,]
    for (d := 1; d < 10.pow(6); d++) {
      squareDivisors(d).findAll { it < d }.each |r| {
        n := d * d * d / r + r
        if (isSquare(n) && n < max) {
          ns.add(n)
        }
      }
    }
    res := sum(ns.unique)
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Bool isSquare(Int n) {
    return n == n.toFloat.sqrt.round.toInt.pow(2)
  }

  Int[] squareDivisors(Int n) {
    Int[] divs := divisors(n)
    Int:Bool allDivs := [:]
    for (i := 0; i < divs.size; i++) {
      for (j := i; j < divs.size; j++) {
        allDivs[divs[i] * divs[j]] = true
      }
    }
    return allDivs.keys
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

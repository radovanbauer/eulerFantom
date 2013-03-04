class Problem132 {
  Void main() {
    res := sum(repunitPrimeFactors(10.pow(9), 40))
    echo(res)
  }

  Int[] repunitPrimeFactors(Int k, Int cnt) {
    res := [,]
    d := 2
    while (res.size < cnt) {
      if (d != 2 && d != 5 && isPrime(d) && powMod(10, k, 9 * d) == 1) {
        res.add(d)
      }
      d++
    }
    return res
  }

  Int powMod(Int base, Int exp, Int mod) {
    if (exp == 0) return 1
    p := powMod(base, exp / 2, mod)
    return exp % 2 == 0 ? (p * p) % mod : (p * p * base) % mod
  }

  Bool isPrime(Int n) {
    if (n <= 1) return false
    for (d := 2; d * d <= n; d++) {
      if (n % d == 0) {
        return false
      }
    }
    return true
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

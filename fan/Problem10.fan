class Problem10 {
  Void main() {
    primes := (1..<2_000_000).toList.findAll { isPrime(it) }
    res := primes.reduce(0, |Int a, Int b -> Int| { a + b })
    echo(res)
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
}

class Problem7 {
  Void main() {
    res := (1..1000000).toList.findAll { isPrime(it) } [10000]
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

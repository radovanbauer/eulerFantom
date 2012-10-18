class Problem58 {
  Void main() {
    all := 1
    primes := 0
    for (n := 3;; n+=2) {
      all += 4
      primes += (0..3).map { n * n - it * (n - 1) }.findAll { isPrime(it) }.size
      if (primes * 10 < all) {
        echo(n)
        return
      }
    }
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

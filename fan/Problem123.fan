class Problem123 {
  Void main() {
    n := 0
    for (p := 1;; p++) {
      if (isPrime(p)) {
        n++
        if (n % 2 == 1 && 2 * n * p > 10.pow(10)) {
          echo(n)
          return
        }
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

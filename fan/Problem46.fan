class Problem46 {
  Void main() {
    for (n := 3;; n+=2) {
      if (!isPrime(n) &&
          (1..n.toFloat.div(0.5f).sqrt.toInt).toList.all { !isPrime(n - 2 * it * it) }) {
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

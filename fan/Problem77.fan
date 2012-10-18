class Problem77 {
  Void main() {
    Int[][] ways := [,]
    ways.add([1])
    for (n := 1;; n++) {
      ways.add([0])
      (1..n).each |k| {
        ways[n].add(ways[n][k - 1])
        if (n >= k && isPrime(k)) ways[n][k] += ways[n - k][k.min(n - k)]
      }
      if (ways[n][n - 1] >= 5000) {
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

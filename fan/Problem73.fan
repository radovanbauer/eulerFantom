class Problem73 {
  Void main() {
    count := 0
    (1..12_000).each |d| {
      (1..<12_000).each |n| {
        if (3 * n > d && 2 * n < d && gcd(n, d) == 1) count++
      }
    }
    echo(count)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

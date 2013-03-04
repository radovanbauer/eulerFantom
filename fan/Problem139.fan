class Problem139 {
  Void main() {
    res := 0
    max := 100_000_000
    for (m := 1; m <= max.toFloat.sqrt.toInt; m++) {
      for (n := 1; n < m; n++) {
        if ((m - n) % 2 == 1 && gcd(m, n) == 1) {
          a := m * m - n * n
          b := 2 * m * n
          c := m * m + n * n
          if (a + b + c < max && c % (a - b) == 0) {
            res += max / (a + b + c)
          }
        }
      }
    }
    echo(res)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

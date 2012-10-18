class Problem71 {
  Void main() {
    IntFrac[] fractions := (1..1_000_000).map |d| {
      n := (d * 3 - 1) / 7
      while (n > 0  && gcd(n, d) != 1) n--
      return IntFrac(n, d)
    }
    res := fractions.max.n
    echo(res)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

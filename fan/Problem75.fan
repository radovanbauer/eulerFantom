class Problem75 {
  Void main() {
    max := 1_500_000
    Int[] count := (0..max).map { 0 }
    for (n := 1; 2 * n * n < max; n++) {
      for (m := 1; m < n; m++) {
        if ((n % 2 == 1 && m % 2 == 1) || gcd(n, m) != 1) continue
        sum := 2 * n * n + 2 * n * m
        k := sum
        while (k <= max) {
          count[k]++
          k += sum
        }
      }
    }
    res := count.findAll { it == 1 }.size
    echo(res)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

class Problem142 {
  Void main() {
    for (sum := 3;; sum++) {
      for (m := 1; m * m * m * m < sum; m++) {
        for (n := 1; n < m; n++) {
          if ((m - n) % 2 == 1 && gcd(m, n) == 1) {
            for (k := 1; k * k * m * m * m * m < sum; k++) {
              a := k * k * (m * m - n * n) * (m * m - n * n)
              b := k * k * 4 * m * m * n * n
              c := k * k * (m * m + n * n) * (m * m + n * n)

              if ((sum - c - a) % 3 == 0 && sum - c - a > 0) {
                z := (sum - c - a) / 3
                y := z + a
                x := z + c
                if (isSquare(x + y) && isSquare(x + z) && isSquare(y + z)) {
                  echo(sum)
                  return
                }
              }

              if ((sum - c - b) % 3 == 0 && sum - c - b > 0) {
                z := (sum - c - b) / 3
                y := z + b
                x := z + c
                if (isSquare(x + y) && isSquare(x + z) && isSquare(y + z)) {
                  echo(sum)
                  return
                }
              }
            }
          }
        }
      }
    }
  }

  Bool isSquare(Int n) {
    return n == n.toFloat.sqrt.round.toInt.pow(2)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

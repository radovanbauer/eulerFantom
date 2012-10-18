class Problem94 {
  Void main() {
    max := 1_000_000_000
    sum := 0
    for (a := 3; a * 3 - 1 <= max; a += 2) {
      if (isSquare(a * a - (a - 1) * (a - 1) / 4)) {
        sum += 3 * a - 1
      }
    }
    for (a := 3; a * 3 + 1 <= max; a += 2) {
      if (isSquare(a * a - (a + 1) * (a + 1) / 4)) {
        sum += 3 * a + 1
      }
    }
    echo(sum)
  }

  Bool isSquare(Int n) {
    return n >= 0 && n == n.toFloat.sqrt.round.toInt.pow(2)
  }
}
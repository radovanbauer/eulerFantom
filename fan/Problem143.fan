class Problem143 {
  Void main() {
    max := 120_000
    sums := Int:Bool[:]
    for (p := 1; 3 * p <= max; p++) {
      for (q := p; p + 2 * q <= max; q++) {
        if (isSquare(p * p + q * q + p * q)) {
          for (r := q; p + q + r <= max; r++) {
            if (isSquare(p * p + r * r + p * r) && isSquare(q * q + r * r + q * r)) {
              sums[p + q + r] = true
            }
          }
        }
      }
    }
    res := sum(sums.keys)
    echo(res)
  }

  Bool isSquare(Int n) {
    return n == n.toFloat.sqrt.round.toInt.pow(2)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

class Problem44 {
  Void main() {
    for (i := 1;; i++) {
      p1 := pentagonal(i)
      for (j := 1; pentagonal(j + 1) - pentagonal(j) <= p1; j++) {
        p2 := pentagonal(j)
        if (isPentagonal(p1 + p2) && isPentagonal(p1 + 2 * p2)) {
          echo(p1)
          return
        }
      }
    }
  }

  Bool isPentagonal(Int p) {
    return (((24 * p + 1).toFloat.sqrt + 1) / 6) % 1 == 0F
  }

  Int pentagonal(Int n) {
    return n * (3 * n - 1) / 2
  }
}

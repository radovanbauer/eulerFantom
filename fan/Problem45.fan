class Problem45 {
  Void main() {
    for (i := 286;; i++) {
      if (isPentagonal(triangle(i)) && isHexagonal(triangle(i))) {
        echo(triangle(i))
        return
      }
    }
  }

  Int triangle(Int n) {
    return n * (n + 1) / 2
  }

  Bool isTriangle(Int t) {
    return (((1 + 8 * t).toFloat.sqrt - 1) / 2) % 1 == 0F
  }

  Int pentagonal(Int n) {
    return n * (3 * n - 1) / 2
  }

  Bool isPentagonal(Int p) {
    return (((24 * p + 1).toFloat.sqrt + 1) / 6) % 1 == 0F
  }

  Int hexagonal(Int n) {
    return n * (2 * n - 1)
  }

  Bool isHexagonal(Int h) {
    return (((8 * h + 1).toFloat.sqrt + 1) / 4) % 1 == 0F
  }
}

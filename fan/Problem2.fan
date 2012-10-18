class Problem2 {
  Void main() {
    a := 1
    b := 1
    sum := 0
    while (a < 4_000_000) {
      if (a % 2 == 0) sum += a
      b += a
      a = b - a
    }
    echo(sum)
  }
}

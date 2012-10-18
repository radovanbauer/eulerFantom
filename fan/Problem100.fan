class Problem100 {
  Void main() {
    p1 := 0
    p2 := 1
    while (true) {
      if ((p1 + p2) * (p1 + p2) - 2 * p2 * p2 == -1) {
        a := (p2 + 1) / 2
        b := (p1 + p2 + 1) / 2
        if (b >= 10.pow(12)) {
          echo(a)
          return
        }
      }
      next := 2 * p2 + p1
      p1 = p2
      p2 = next
    }
  }
}

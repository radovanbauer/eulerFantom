class Problem25 {
  Void main() {
    a := 1D
    b := 1D
    idx := 1
    while (a.toStr.size < 1000) {
      b = a + b
      a = b - a
      idx++
    }
    echo(idx)
  }
}

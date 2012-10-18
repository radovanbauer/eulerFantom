class Problem85 {
  Void main() {
    best := [0, 0]
    min := Int.maxVal
    for (n := 1; f(n, 1) < min; n++) {
      for (m := 1; f(n, m) < min; m++) {
        if (f(n, m).abs < min) {
          min = f(n, m).abs
          best = [n, m]
        }
      }
    }
    res := best[0] * best[1]
    echo(res)
  }

  Int f(Int n, Int m) {
    return rect(n, m) - 2_000_000
  }

  Int rect(Int n, Int m) {
    return (n + 1) * (m + 1) * n * m / 4
  }
}
  
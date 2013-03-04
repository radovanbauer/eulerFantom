class Problem135 {
  Void main() {
    res := solutions(1_000_000 - 1).findAll { it == 10 }.size
    echo(res)
  }

  Int[] solutions(Int n) {
    Int[] cnt := (0..n).map { 0 }
    for (y := 1; y <= n; y++) {
      for (d := y / 4 + 1; d < y && y * (4 * d - y) <= n; d++) {
        cnt[y * (4 * d - y)]++
      }
    }
    return cnt
  }
}

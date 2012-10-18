class Problem78 {
  Void main() {
    p := [1]
    for (n := 1;; n++) {
      p.add(0)
      for (k := 1; k <= n; k++) {
        q := k % 2 == 0 ? -1 : 1
        idx1 := n - k * (3 * k - 1) / 2
        idx2 := n - k * (3 * k + 1) / 2
        if (idx1 >= 0) p[n] = mod(p[n] + q * p[idx1], 1_000_000)
        if (idx2 >= 0) p[n] = mod(p[n] + q * p[idx2], 1_000_000)
      }
      if (p[n] == 0) {
        echo(n)
        return
      }
    }

  }

  Int mod(Int a, Int b) {
    while (a < 0) a += b
    return a % b
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

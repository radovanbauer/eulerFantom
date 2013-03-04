class Problem148 {
  Void main() {
    res := nonDiv(10.pow(9) - 1)
    echo(res)
  }

  Int nonDiv(Int m) {
    cnt := 0
    for (n := 0; n <= m; n++) {
      p := 1
      k := n
      while (k > 0) {
        p *= (k % 7) + 1
        k /= 7
      }
      cnt += p
    }
    return cnt
  }
}

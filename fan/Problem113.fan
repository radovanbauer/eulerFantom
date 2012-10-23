class Problem113 {
  Void main() {
    cnt := 0D
    for (d := 1; d <= 100; d++) {
      cnt += comb(8 + d, d) + comb(9 + d, d) - 10
    }
    echo(cnt)
  }

  Decimal comb(Int n, Int k) {
    return fact(n) / fact(k) / fact(n - k)
  }

  Decimal fact(Int d) {
    res := 1D
    while (d > 0) {
      res *= d
      d--
    }
    return res
  }
}

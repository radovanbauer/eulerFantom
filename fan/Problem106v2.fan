class Problem106v2 {
  Void main() {
    res := solve(12)
    echo(res)
  }

  Decimal solve(Int n) {
    return sum((2..n / 2).map |k| {
      comb(n, 2 * k) * (comb(2 * k, k) / 2 - comb(2 * k, k) / (k + 1))
    })
  }

  Decimal sum(Decimal[] list) {
    return list.reduce(0D, |Decimal a, Decimal b -> Decimal| { a + b })
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

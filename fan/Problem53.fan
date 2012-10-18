class Problem53 {
  Void main() {
    res := (1..100).map |n| { (0..n).map |k| { comb(n, k) } }
        .flatten
        .findAll { it > 1_000_000D }
        .size
    echo(res)
  }

  Decimal comb(Int n, Int k) {
    return fact(n) / fact(k) / fact(n - k)
  }

  Decimal fact(Num n) {
    d := n.toDecimal
    if (d < 0D) throw ArgErr()
    res := 1D
    while (d > 0D) res *= d--
    return res
  }
}

class Problem48 {
  Void main() {
    res := sum((1..1000).map { this.pow(it, it) }) % pow(10, 10)
    echo(res)
  }

  Decimal sum(Decimal[] list) {
    return list.reduce(0D, |Decimal a, Decimal b -> Decimal| { a + b })
  }

  Decimal pow(Num num, Int exp) {
    if (exp < 0) throw ArgErr()
    d := num.toDecimal
    res := 1D
    exp.times { res *= d }
    return res
  }
}

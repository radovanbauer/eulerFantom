class Problem29 {
  Void main() {
    res := (2..100).map |a| { (2..100).map |b| { pow(a, b) } }.flatten.unique.size
    echo(res)
  }

  Decimal pow(Num num, Int exp) {
    if (exp < 0) throw ArgErr()
    d := num.toDecimal
    res := 1D
    exp.times { res *= d }
    return res
  }
}

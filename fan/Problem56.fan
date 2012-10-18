class Problem56 {
  Void main() {
    res := (1..<100).map |a| { (1..<100).map |b| { sumOfDigits(pow(a, b)) } }.flatten.max
    echo(res)
  }

  Decimal pow(Num num, Int exp) {
    if (exp < 0) throw ArgErr()
    d := num.toDecimal
    res := 1D
    exp.times { res *= d }
    return res
  }

  Int sumOfDigits(Decimal d) {
    sum := 0
    d.toStr.each { sum += it.fromDigit }
    return sum
  }
}

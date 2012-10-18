class Problem16 {
  Void main() {
    res := sumOfDigits(pow(2D, 1000))
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

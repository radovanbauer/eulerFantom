class Problem20 {
  Void main() {
    res := sumOfDigits(fact(100D))
    echo(res)
  }

  Int sumOfDigits(Decimal d) {
    sum := 0
    d.toStr.each { sum += it.fromDigit }
    return sum
  }

  Decimal fact(Decimal d) {
    return d == 0D ? 1D : d * fact(d - 1D)
  }
}

class Problem80 {
  Void main() {
    res := sum((1..100)
        .toList
        .findAll { !isSquare(it) }
        .map { sqrt(it * this.pow(10, 200)).toStr[0..<100].toDecimal }
        .map { sumOfDigits(it) })
    echo(res)
  }

  Bool isSquare(Int n) {
    return n >= 0 && n == n.toFloat.sqrt.round.toInt.pow(2)
  }

  Decimal sqrt(Decimal n) {
    low := 0D
    high := n
    while (high - low > 1D) {
      mid := floor((low + high) / 2)
      if (mid * mid > n) {
        high = mid
      } else {
        low = mid
      }
    }
    return low
  }

  Decimal floor(Decimal d) {
    return d - d % 1
  }

  Decimal pow(Num num, Int exp) {
    if (exp < 0) throw ArgErr()
    d := num.toDecimal
    res := 1D
    exp.times { res *= d }
    return res
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Int sumOfDigits(Decimal d) {
    sum := 0
    d.toStr.each { sum += it.fromDigit }
    return sum
  }
}

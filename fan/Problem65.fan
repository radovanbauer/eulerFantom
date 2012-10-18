class Problem65 {
  Void main() {
    res := sumOfDigits(calcE(100).n)
    echo(res)
  }

  DecFrac calcE(Int k) {
    spec := (1..k).map |n| {
      if (n == 1) return 2
      else if (n % 3 != 0) return 1
      else return n / 3 * 2 
    }
    return contFrac(spec)
  }

  DecFrac contFrac(Int[] spec) {
    if (spec.isEmpty) throw ArgErr(spec.toStr)
    res := DecFrac(spec.last)
    if (spec.size > 1) {
      spec[0..spec.size - 2].reverse.each |n| {
        res = DecFrac(n) + DecFrac(1) / res
      }
    }
    return res
  }

  Int sumOfDigits(Decimal d) {
    sum := 0
    d.toStr.each { sum += it.fromDigit }
    return sum
  }
}

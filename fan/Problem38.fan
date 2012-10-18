class Problem38 {
  Void main() {
    max := 0D
    (2..9).each |n| {
      (1..<10_000).each |num| {
        prod := (1..n).map { (num * it).toStr }.join.toDecimal
        if (isPandigital(prod)) {
          max = max.max(prod)
        }
      }
    }
    echo(max)
  }

  Bool isPandigital(Decimal n) {
    return n.toStr.chars.sort == ('1'..'9').toList
  }
}

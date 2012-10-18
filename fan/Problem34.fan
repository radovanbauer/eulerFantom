class Problem34 {
  Void main() {
    res := sum((10..<10_000_000).toList.findAll |n| { isCurious(n) })
    echo(res)
  }

  Bool isCurious(Int n) {
    return sum(n.toStr.chars.map { fact(it.fromDigit) }) == n
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Int fact(Int d) {
    return d == 0 ? 1 : d * fact(d - 1)
  }
}

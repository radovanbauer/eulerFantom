class Problem30 {
  Void main() {
    res := sum((10..<1000000).toList.findAll |n| { sum(digits(n).map |d| { d.pow(5) }) == n })
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Int[] digits(Int n) {
    return n.toStr.chars.map { it.fromDigit }
  }
}

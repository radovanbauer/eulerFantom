class Problem55 {
  Void main() {
    res := (1..<10_000).toList.findAll { isLychrel(it.toDecimal) }.size
    echo(res)
  }

  Bool isLychrel(Decimal n) {
    res := true
    50.times {
      n = n + n.toStr.reverse.toDecimal
      if (isPalindrome(n)) res = false
    }
    return res
  }

  Bool isPalindrome(Decimal n) {
    return n.toStr == n.toStr.reverse
  }
}

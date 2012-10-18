class Problem36 {
  Void main() {
    nums := (1..<1_000_000).toList.findAll { isPalindrome(it.toStr) && isPalindrome(toBin(it)) }
    res := sum(nums)
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Str toBin(Int n) {
    if (n < 0) throw ArgErr()
    if (n == 0) return "0"
    res := StrBuf()
    while (n > 0) {
      res.add(n % 2)
      n /= 2
    }
    return res.toStr.reverse
  }

  Bool isPalindrome(Str s) {
    return s.reverse == s
  }
}

class Problem4 {
  Void main() {
    max := 0
    for (a := 100; a < 1000; a++) {
      for (b := a; b < 1000; b++) {
        if (isPalindrome(a * b)) {
          max = max.max(a * b)
        }
      }
    }
    echo(max)
  }

  Bool isPalindrome(Int n) {
    return n.toStr.reverse == n.toStr
  }
}

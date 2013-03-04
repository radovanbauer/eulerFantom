class Problem145 {
  Void main() {
    cnt := 0
    for (i := 0; i < 1_000_000_000; i++) {
      if (isReversible(i)) {
        cnt++
      }
    }
    echo(cnt)
  }

  Bool isReversible(Int n) {
    return n % 10 != 0 && hasOddDigits(n + reverse(n))
  }

  Bool hasOddDigits(Int n) {
    return n.toStr.chars.all { it.fromDigit % 2 == 1 }
  }

  Int reverse(Int n) {
    return Str.fromChars(n.toStr.chars.reverse).toInt
  }
}

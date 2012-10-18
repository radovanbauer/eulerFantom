class Problem104 {
  Void main() {
    fib1 := 1D
    fib2 := 1D
    fibLast1 := 1
    fibLast2 := 1
    k := 1
    while (true) {
      if (isPandigital(fibLast1.toStr) && isPandigital(fib1.toStr[0..8])) {
        echo(k)
        return
      }
      nextFib := fib1 + fib2
      nextFibLast := (fibLast1 + fibLast2) % 10_000_000_000
      fib1 = fib2
      fib2 = nextFib
      fibLast1 = fibLast2
      fibLast2 = nextFibLast
      k++
    }
  }

  Bool isPandigital(Str str) {
    if (str.size != 9) return false
    digits := Bool[,] { fill(false, 9) }
    for (i := 0; i < 9; i++) {
      if (digits[str[i].fromDigit - 1]) {
        return false
      }
      digits[str[i].fromDigit - 1] = true
    }
    return true
  }
}

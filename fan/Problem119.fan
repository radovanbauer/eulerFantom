class Problem119 {
  Void main() {
    cnt := 0
    pows := [2 : minExp(2)]
    while (true) {
      next := pows.vals.min
      base := pows.findAll { it == next }.keys.min
      if (next >= 10 && sumOfDigits(next) == base) {
        cnt++
        if (cnt == 30) {
          echo(next)
          return
        }
      }
      pows[base] *= base
      if (!pows.containsKey(base + 1)) {
        pows[base + 1] = (base + 1).pow(minExp(base + 1))
      }
    }
  }

  Int minExp(Int base) {
    return (base.toFloat / 9F / base.toFloat.log10).ceil.toInt
  }

  Int sumOfDigits(Int n) {
    sum := 0
    n.toStr.each { sum += it.fromDigit }
    return sum
  }
}

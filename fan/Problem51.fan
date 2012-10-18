class Problem51 {
  Void main() {
    for (n := 1;; n++) {
      if (isPrime(n)) {
        for (mask := 1; mask < 1.shiftl(n.toStr.size); mask++) {
          replacements := (0..9).map { replace(n, it, mask) }
              .findAll { isPrime(it) && it.toStr.size == n.toStr.size }
          if (replacements.contains(n) && replacements.size == 8) {
            echo(n)
            return
          }
        }
      }
    }
  }

  Int replace(Int n, Int r, Int mask) {
    res := n.toStr.chars.map { it.fromDigit }
    (0..<res.size).toList.findAll { mask.and(1.shiftl(it)) != 0 }.each |d| {
      res[d] = r
    }
    return res.join.toInt
  }

  Bool isPrime(Int n) {
    if (n <= 1) return false
    for (d := 2; d * d <= n; d++) {
      if (n % d == 0) {
        return false
      }
    }
    return true
  }
}

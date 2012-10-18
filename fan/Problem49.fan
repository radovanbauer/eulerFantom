class Problem49 {
  Void main() {
    (1..9999).toList.findAll { isPrime(it) }.each |a| {
      (a + 1..9999).toList.findAll { isPrime(it) }.each |b| {
        c := b + (b - a)
        con := [a, b, c].join
        if (c <= 9999 &&
            isPrime(c) &&
            a.toStr.chars.sort == b.toStr.chars.sort &&
            b.toStr.chars.sort == c.toStr.chars.sort &&
            con != "148748178147") {
          echo(con)
          return
        }
      }
    }
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

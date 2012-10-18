class Problem33 {
  Void main() {
    resNom := 1
    resDen := 1
    (1..9).each |a| {
      (1..9).each |b| {
        (1..9).each |c| {
          (1..9).each |d| {
            nom := 10 * a + b
            den := 10 * c + d
            if (nom >= den) return
            if ((a == d && nom * c == den * b) || (b == c && nom * d == den * a)) {
              resNom *= nom
              resDen *= den
            }
          }
        }
      }
    }
    res := resDen / gcd(resNom, resDen)
    echo(res)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

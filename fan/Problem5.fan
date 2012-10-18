class Problem5 {
  Void main() {
    res := (1..20).toList.reduce(1, |a, b| { lcm(a, b) })
    echo(res)
  }

  Int lcm(Int a, Int b) {
    return a * b / gcd(a, b)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

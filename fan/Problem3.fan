class Problem3 {
  Void main() {
    n := 600851475143
    d := 2
    while (n > 1) {
      if (n % d == 0) {
        n /= d
      } else {
        d++
      }
    }
    echo(d)
  }
}

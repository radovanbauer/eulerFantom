class Problem12 {
  Void main() {
    n := 0
    for (i := 1; true; i++) {
      n += i
      if (divisors(n).size >= 500) {
        echo(n)
        return
      }
    }
  }

  Int[] divisors(Int n) {
    res := [,]
    for (i := 1; i * i <= n; i++) {
      if (n % i == 0) {
        res.add(i)
        if (i != n / i) {
          res.add(n / i)
        }
      }
    }
    return res
  }
}

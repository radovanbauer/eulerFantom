class Problem110 {
  Void main() {
    solve(0, 1, 1)
    echo(min)
  }

  const Int[] primes := [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43]
  Int min := prod(primes)

  Void solve(Int k, Int coefProd, Int prod) {
    if (k == primes.size) {
      if (coefProd > 7_999_999) {
        min = min.min(prod)
      }
      return
    }
    for (coef := 0;; coef++) {
      newCoefProd := coefProd * (2 * coef + 1)
      newProd := prod * (primes[k].pow(coef))
      if (newProd < min) {
        solve(k + 1, newCoefProd, newProd)
      } else {
        break
      }
    }
  }

  Int prod(Int[] list) {
    return list.reduce(1, |Int a, Int b -> Int| { a * b })
  }
}

class Problem130 {
  Void main() {
    res := solve(25)
    echo(res)
  }

  Int solve(Int k) {
    nums := [,]
    for (n := 2;; n++) {
      if (n % 2 != 0 && n % 5 != 0 && !isPrime(n)) {
        if ((n - 1) % a(n) == 0) {
          nums.add(n)
        }
        if (nums.size >= k) {
          return sum(nums)
        }
      }
    }
    throw Err()
  }

  Int a(Int n) {
    divisors(totient(9 * n)).sort.eachWhile { powMod(10, it, 9 * n) == 1 ? it : null }
  }

  Int powMod(Int base, Int exp, Int mod) {
    if (exp == 0) return 1
    p := powMod(base, exp / 2, mod)
    return exp % 2 == 0 ? (p * p) % mod : (p * p * base) % mod
  }

  Int totient(Int n) {
    primes := primeDivisors(n)
    return n / prod(primes) * prod(primes.map { it - 1 })
  }

  Int[] primeDivisors(Int n) {
    return divisors(n).findAll { isPrime(it) }
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

  Bool isPrime(Int n) {
    if (n <= 1) return false
    for (d := 2; d * d <= n; d++) {
      if (n % d == 0) {
        return false
      }
    }
    return true
  }

  Int prod(Int[] list) {
    return list.reduce(1, |Int a, Int b -> Int| { a * b })
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

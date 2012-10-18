class Problem70 {
  Void main() {
    min := Float.posInf
    res := 0
    (2..<10_000_000).each {
      t := totient(it)
      ratio := it.toFloat / t
      if (it.toStr.chars.sort == t.toStr.chars.sort && min > ratio) {
        min = ratio
        res = it
      }
    }
    echo(res)
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
}

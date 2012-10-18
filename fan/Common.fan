class Common {
  Int lcm(Int a, Int b) {
    return a * b / gcd(a, b)
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Int prod(Int[] list) {
    return list.reduce(1, |Int a, Int b -> Int| { a * b })
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

  Decimal pow(Num num, Int exp) {
    if (exp < 0) throw ArgErr()
    d := num.toDecimal
    res := 1D
    exp.times { res *= d }
    return res
  }

  Int sumOfDigits(Decimal d) {
    sum := 0
    d.toStr.each { sum += it.fromDigit }
    return sum
  }

  Bool isPalindrome(Int n) {
    return n.toStr.reverse == n.toStr
  }

  Decimal fact(Decimal d) {
    return d == 0D ? 1D : d * fact(d - 1D)
  }

  Int[] properDivisors(Int n) {
    return divisors(n).findAll { it < n }
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

  Int[]? nextPerm(Int[] perm) {
    if (perm.size <= 1) return null
    a := perm.size - 2
    while (a >= 0 && perm[a] >= perm[a + 1]) a--
    if (a == -1) return null
    b := a + 1
    for (i := a + 1; i < perm.size; i++) {
      if (perm[i] > perm[a] && perm[i] < perm[b]) {
        b = i
      }
    }
    res := perm.dup
    res.swap(a, b)
    res = res[0..a].addAll(res[a + 1..<res.size].reverse)
    return res
  }
}

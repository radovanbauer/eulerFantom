class Problem21 {
  Void main() {
    res := sum((1..<10000).toList.findAll { isAmicable(it) })
    echo(res)
  }

  Bool isAmicable(Int n) {
    other := sum(properDivisors(n))
    return other != n && sum(properDivisors(other)) == n
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

  Int sum(Int[] list) {
    sum := 0
    list.each { sum += it }
    return sum
  }
}

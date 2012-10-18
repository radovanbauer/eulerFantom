class Problem27 {
  Void main() {
    max := [0, 0, 0]
    (-999..999).each |a| {
      (-999..999).each |b| {
        count := primeCount(a, b)
        if (count > max[2]) {
          max = [a, b, count]
        }
      }
    }
    res := max[0] * max[1]
    echo(res)
  }

  Int primeCount(Int a, Int b) {
    count := 0
    while (isPrime(count * count + a * count + b)) {
      count++
    }
    return count
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

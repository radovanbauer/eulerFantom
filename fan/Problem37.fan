class Problem37 {
  Void main() {
    res := sum((10..<1_000_000).toList.findAll { isTruncatablePrime(it) })
    echo(res)
  }

  Bool isTruncatablePrime(Int n) {
    size := n.toStr.size
    return isPrime(n)
        && (1..<size).toList.all { isPrime(n.toStr[it..<size].toInt) }
        && (1..<size).toList.all { isPrime(n.toStr[0..<size - it].toInt) }
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
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

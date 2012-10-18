class Problem35 {
  Void main() {
    res := (1..<1_000_000).toList.findAll { isCircularPrime(it) }.size
    echo(res)
  }

  Bool isCircularPrime(Int n) {
    nStr := n.toStr
    res := true
    nStr.size.times {
      if (!isPrime(nStr.toInt)) {
        res = false
      }
      nStr = nStr[1..<nStr.size] + nStr[0..0]
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
}

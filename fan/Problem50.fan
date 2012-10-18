class Problem50 {
  Void main() {
    Int[] primes := (1..<1_000_000).toList.findAll { isPrime(it) }
    Int[] primeSums := (0..primes.size).map { 0 }
    primes.each |prime, idx| {
      primeSums[idx + 1] = primeSums[idx] + primes[idx]
    }
    for (d := primes.size; d >= 0; d--) {
      for (i := 0; i + d <= primes.size; i++) {
        sum := primeSums[i + d] - primeSums[i]
        if (sum < 1_000_000 && isPrime(sum)) {
          echo(sum)
          return
        }
      }
    }
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

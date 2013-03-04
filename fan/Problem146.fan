using [java] java.math::BigInteger as BigInteger

class Problem146 {
  Void main() {
    max := 150_000_000
    primes := primes((max * max + 27).toFloat.sqrt.ceil.toInt)
    sum := 0
    for (n := 10; n < max; n += 10) {
      if (isInteresting(n, primes)) {
        sum += n
      }
    }
    echo(sum)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Bool isInteresting(Int n, Int[] primes) {
    return n % 10 == 0 && n % 3 != 0 && (n % 7 == 3 || n % 7 == 4) && n % 13 != 0 && n % 27 != 0
        && isProbablePrime(n * n + 1)
        && isProbablePrime(n * n + 3)
        && isProbablePrime(n * n + 7)
        && isProbablePrime(n * n + 9)
        && isProbablePrime(n * n + 13)
        && isProbablePrime(n * n + 27)
        && isPrime(n * n + 1, primes)
        && isPrime(n * n + 3, primes)
        && isPrime(n * n + 7, primes)
        && isPrime(n * n + 9, primes)
        && isPrime(n * n + 13, primes)
        && isPrime(n * n + 27, primes)
        && !isPrime(n * n + 15, primes)
        && !isPrime(n * n + 19, primes)
        && !isPrime(n * n + 21, primes)
        && !isPrime(n * n + 25, primes);
  }

  Bool isProbablePrime(Int n) {
    return BigInteger.valueOf(n).isProbablePrime(3)
  }

  Decimal powMod(Decimal base, Int exp, Decimal mod) {
    if (exp == 0) return 1D
    p := powMod(base, exp / 2, mod)
    return exp % 2 == 0 ? (p * p) % mod : (((p * p) % mod) * base) % mod
  }

  Bool isPrime(Int n, Int[] primes) {
    for (i := 0; primes[i] * primes[i] <= n; i++) {
      if (n % primes[i] == 0) {
        return false
      }
    }
    return true
  }

  Int[] primes(Int max) {
    Int[] primes := [,]
    Bool[] sieve := (0..max).map { false }
    for (d := 2; d <= max; d++) {
      if (!sieve[d]) {
        primes.add(d)
        k := d * 2
        while (k <= max) {
          sieve[k] = true
          k += d
        }
      }
    }
    return primes
  }

  Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }
}

class Problem128 {
  Void main() {
    Bool[] primes := primes(1_000_000)
    side := -1
    sideLen := 1
    pos := 0
    start := 2
    cnt := 1
    n := 1
    while(true) {
      if (sideLen > 1 && side == 5 && pos == 0) {
        n += sideLen - 1
        pos = sideLen - 1
      } else if (side == 5) {
        n++
        pos = 0
        side = 0
        sideLen++
        start = n
      } else {
        n += sideLen
        pos = 0
        side++
      }
      Int[] sur := [,]
      if (pos != 0) {
        sur.add(start - 6 * (sideLen - 1) + mod(side * (sideLen - 1) + pos - 1, 6 * (sideLen - 1)))
      }
      if (sideLen == 1) {
        sur.add(1)
      } else {
        sur.add(start - 6 * (sideLen - 1) + mod(side * (sideLen - 1) + pos, 6 * (sideLen - 1)))
      }
      sur.add(start + mod(side * sideLen + pos - 1, 6 * sideLen))
      sur.add(start + mod(side * sideLen + pos + 1, 6 * sideLen))
      sur.add(start + 6 * sideLen + mod(side * (sideLen + 1) + pos, 6 * (sideLen + 1)))
      sur.add(start + 6 * sideLen + mod(side * (sideLen + 1) + pos + 1, 6 * (sideLen + 1)))
      if (pos == 0) {
        sur.add(start + 6 * sideLen + mod(side * (sideLen + 1) + pos - 1, 6 * (sideLen + 1)))
      }
      primeNum := sur.map { (n - it).abs }.findAll |Int a -> Bool| { primes[a] }.size
      if (primeNum == 3) {
        cnt++
      }
      if (cnt == 2000) {
        echo(n)
        return
      }
    }
  }

  Int mod(Int a, Int b) {
    while (a < 0) a += b
    return a % b
  }

  Bool[] primes(Int max) {
    Bool[] sieve := (0..max).map { true }
    sieve[0] = false
    sieve[1] = false
    for (d := 2; d <= max; d++) {
      if (sieve[d]) {
        k := d * 2
        while (k <= max) {
          sieve[k] = false
          k += d
        }
      }
    }
    return sieve
  }
}

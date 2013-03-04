class Problem152 {
  Void main() {
    max := 80
    base := (2..max).toList.findAll { [2, 3].containsAll(primeDivisors(it)) }
    echo(base)
    Int[][][] primeGroups := primes(max).findAll { it > 3 }.map |p| { goodSubsets(p, max) }
    primeGroups = primeGroups.findAll { !it.isEmpty }
    primeGroups.insert(0, subsets(base))
    echo(primeGroups.map { it.size })
    echo(solve(0, primeGroups, [:]))
  }

  Int solve(Int next, Int[][][] primeGroups, Int:Bool nums) {
    if (next == primeGroups.size) {
      if (DecFrac.sum(nums.keys.map { DecFrac(1, it * it) }) == DecFrac(1, 2)) {
        echo(nums.keys.sort)
        return 1
      } else {
        return 0
      }
    } else {
      res := 0
      primeGroups[next].each |primeGroup| {
        nextNums := nums.dup
        primeGroup.each { nextNums[it] = true }
        res += solve(next + 1, primeGroups, nextNums)
      }
      res += solve(next + 1, primeGroups, nums)
      return res
    }
  }

  Int[][] goodSubsets(Int d, Int max) {
    x := (2..max).toList.findAll { it % d == 0 }
    return subsets(x).findAll |subset| { !subset.isEmpty && squareSum(subset).d % d != 0D }
  }

  DecFrac squareSum(Int[] list) {
    return DecFrac.sum(list.map { DecFrac(1, it * it) })
  }

  Int[][] subsets(Int[] set) {
    Int[][] result := [,]
    for (mask := 0; mask < 1.shiftl(set.size); mask++) {
      subset := [,]
      for (k := 0; k < set.size; k++) {
        if (1.shiftl(k).and(mask) > 0) {
          subset.add(set[k])
        }
      }
      result.add(subset)
    }
    return result
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
}

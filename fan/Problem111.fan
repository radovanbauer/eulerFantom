class Problem111 {
  Void main() {
    n := 10
    res := 0
    (0..9).each |d| {
      max := n
      nums := [,]
      while (nums.isEmpty && max >= 0) {
        (0..<10.pow(n - max)).each |k| {
          kDigits := n - max == 0 ? [,] : k.toStr.padl(n - max, '0').chars.map { it.fromDigit }
          if (!kDigits.contains(d) && kDigits == kDigits.dup.sort) {
            Int[]? perm := (0..<max).map { d }.addAll(kDigits).sort
            while (perm != null) {
              num := perm.join.toInt
              if (perm[0] != 0 && isPrime(num)) {
                nums.add(num)
              }
              perm = nextPerm(perm)
            }
          }
        }
        max--
      }
      res += sum(nums.unique)
    }
    echo(res)
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

  Int[]? nextPerm(Int[] perm) {
    if (perm.size <= 1) return null
    a := perm.size - 2
    while (a >= 0 && perm[a] >= perm[a + 1]) a--
    if (a == -1) return null
    b := a + 1
    for (i := a + 1; i < perm.size; i++) {
      if (perm[i] > perm[a] && perm[i] <= perm[b]) {
        b = i
      }
    }
    res := perm.dup
    res.swap(a, b)
    res = res[0..a].addAll(res[a + 1..<res.size].reverse)
    return res
  }
}

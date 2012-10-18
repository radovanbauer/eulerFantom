class Problem41 {
  Void main() {
    max := 0
    (1..7).each |n| {
      Int[]? perm := (1..n).toList
      while (perm != null) {
        num := perm.join.toInt
        if (isPrime(num)) {
          max = max.max(num)
        }
        perm = nextPerm(perm)
      }
    }
    echo(max)
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

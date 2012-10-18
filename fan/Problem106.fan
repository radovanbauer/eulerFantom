class Problem106 {
  Void main() {
    res := solve(12)
    echo(res)
  }

  Int solve(Int n) {
    cnt := 0
    (2..n / 2).each |k| {
      combs := combs(n, k)
      combs.each |comb1| {
        combs.findAll |comb2| { comb1.intersection(comb2).isEmpty && comb1[0] < comb2[0] }.each |comb2| {
          if (!(0..<k).toList.all { comb1[it] < comb2[it] }) cnt++
        }
      }
    }
    return cnt
  }

  Int[][] combs(Int n, Int k) {
    res := [,]
    Int[]? comb := (0..<k).toList
    while (comb != null) {
      res.add(comb)
      comb = nextComb(comb, n)
    }
    return res
  }

  Int[]? nextComb(Int[] comb, Int n) {
    k := comb.size - 1
    while (k >= 0 && comb[k] == n - 1 || (k < comb.size - 1 && comb[k] + 1 == comb[k + 1])) k--
    if (k == -1) return null
    next := comb.dup
    next[k]++
    (k + 1..<comb.size).each |l| { next[l] = next[l - 1] + 1 }
    return next
  }
}

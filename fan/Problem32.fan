class Problem32 {
  Void main() {
    products := [,]
    Int[]? perm := (1..9).toList
    while (perm != null) {
      (1..2).each |i| {
        (i + 1..i + 4).each |j| {
          a := perm[0..<i].join.toInt
          b := perm[i..<j].join.toInt
          c := perm[j..<perm.size].join.toInt
          if (a * b == c) products.add(c)
        }
      }
      perm = nextPerm(perm)
    }
    res := sum(products.unique)
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
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

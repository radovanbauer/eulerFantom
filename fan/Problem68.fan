class Problem68 {
  Void main() {
    max := 0
    Int[]? perm := (1..10).toList
    while (perm != null) {
      Int[][] groups := [[0, 1, 2], [3, 2, 4], [5, 4, 6], [7, 6, 8], [9, 8, 1]]
          .map { it.map { perm[it] } }
      if (groups.map { it[0] }.min == groups[0][0] &&
          groups.map { sum(it) }.unique.size == 1 &&
          groups.map { it.join }.join.size == 16) {
        max = max.max(groups.map { it.join }.join.toInt)
      }
      perm = nextPerm(perm)
    }
    echo(max)
  }

  Int[]? nextPerm(Int[] perm) {
    if (perm.size <= 1) return null
    a := perm.size - 2
    while (a >= 0 && perm[a] >= perm[a + 1]) a--
    if (a == -1) return null
    b := a + 1
    for (i := a + 1; i < perm.size; i++) {
      if (perm[i] > perm[a] && perm[i] < perm[b]) {
        b = i
      }
    }
    res := perm.dup
    res.swap(a, b)
    res = res[0..a].addAll(res[a + 1..<res.size].reverse)
    return res
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

class Problem24 {
  Void main() {
    Int[]? perm := (0..9).toList
    999_999.times { perm = nextPerm(perm) }
    res := perm.join
    echo(res)
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

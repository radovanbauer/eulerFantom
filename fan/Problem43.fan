class Problem43 {
  Void main() {
    sum := 0
    Int[]? perm := (0..9).toList
    while (perm != null) {
      if ([2, 3, 5, 7, 11, 13, 17]
          .all |div, idx| { perm.join[idx + 1..idx + 3].toInt % div == 0 }) {
        sum += perm.join.toInt
      }
      perm = nextPerm(perm)
    }
    echo(sum)
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

class Problem90 {
  Void main() {
    squares := (1..9).map { it * it }
    combs := combs(10, 6)
    cnt := 0
    combs.each |cube1| {
      combs.each |cube2| {
        if (numbers(cube1, cube2).containsAll(squares)) cnt++
      }
    }
    echo(cnt / 2)
  }

  Int[] numbers(Int[] cube1, Int[] cube2) {
    extCube1 := cube1.containsAny([6, 9]) ? cube1.dup.add(6).add(9).unique : cube1
    extCube2 := cube2.containsAny([6, 9]) ? cube2.dup.add(6).add(9).unique : cube2
    return extCube1.map |d1| { extCube2.map |d2| { [10 * d1 + d2, 10 * d2 + d1] } }.flatten.flatten
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

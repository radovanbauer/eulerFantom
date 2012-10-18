class Problem93 {
  Void main() {
    Int[][] digitCombs := (1..<10_000)
        .map { it.toStr.chars.map { it.fromDigit }.sort.unique }
        .unique
        .findAll |Int[] comb -> Bool| { comb.size == 4 }
    max := digitCombs.map { calc(it) }.max
    res := digitCombs.find { calc(it) == max }.join
    echo(res)
  }

  const |IntFrac, IntFrac -> IntFrac|[] binOps := [
    |IntFrac a, IntFrac b -> IntFrac| { a + b },
    |IntFrac a, IntFrac b -> IntFrac| { a - b },
    |IntFrac a, IntFrac b -> IntFrac| { a * b },
    |IntFrac a, IntFrac b -> IntFrac| { b == IntFrac(0) ? throw ArgErr() : a / b }]

  Int calc(Int[] digits) {
    IntFrac:Bool nums := [:]
    IntFrac[]? perm := digits.map { IntFrac(it) }
    while (perm != null) {
      binOps.each |binOp1| {
        binOps.each |binOp2| {
          binOps.each |binOp3| {
            try {
              nums[binOp1(binOp2(binOp3(perm[0], perm[1]), perm[2]), perm[3])] = true
            } catch (ArgErr e) {}
            try {
              nums[binOp1(binOp2(perm[0], binOp3(perm[1], perm[2])), perm[3])] = true
            } catch (ArgErr e) {}
            try {
              nums[binOp1(perm[0], binOp2(binOp3(perm[1], perm[2]), perm[3]))] = true
            } catch (ArgErr e) {}
            try {
              nums[binOp1(perm[0], binOp2(perm[1], binOp3(perm[2], perm[3])))] = true
            } catch (ArgErr e) {}
            try {
              nums[binOp1(binOp2(perm[0], perm[1]), binOp3(perm[2], perm[3]))] = true
            } catch (ArgErr e) {}
          }
        }
      }
      perm = nextPerm(perm)
    }
    max := 0
    while (nums.containsKey(IntFrac(max + 1))) max += 1
    return max
  }

  IntFrac[]? nextPerm(IntFrac[] perm) {
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

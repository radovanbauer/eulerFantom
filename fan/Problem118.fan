class Problem118 {
  Void main() {
    Int[]? perm := (1..9).toList
    cnt := 0
    while (perm != null) {
      cnt += count(perm, 0, 0)
      perm = nextPerm(perm)
    }
    echo(cnt)
  }

  Int count(Int[] nums, Int last, Int start) {
    if (start == nums.size) return 1
    cur := 0
    cnt := 0
    while (start < nums.size) {
      cur = cur * 10 + nums[start]
      start++
      if (cur > last && isPrime(cur)) {
        cnt += count(nums, cur, start)
      }
    }
    return cnt
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

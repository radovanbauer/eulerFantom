class Problem122 {
  Void main() {
    coefs := [1]
    Int:Int m := [1 : 0]
    solve(200, coefs, m)
    res := sum(m.vals)
    echo(res)
  }

  Void solve(Int n, Int[] coefs, Int:Int m) {
    if (coefs.size > 11) return
    sums := coefs.map |c1| { coefs.map |c2| { c1 + c2 } }
        .flatten
        .findAll { it > coefs.last && it <= n }
        .unique
    sums.each |next| {
      coefs.add(next)
      m[next] = m.containsKey(next) ? m[next].min(coefs.size - 1) : coefs.size - 1
      solve(n, coefs, m)
      coefs.removeAt(coefs.size - 1)
    }
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

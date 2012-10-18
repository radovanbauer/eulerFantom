class Problem63 {
  Void main() {
    nums := Decimal[,]
    (1..9).each |n| {
      m := n.toDecimal
      for (d := 1;; d++) {
        if (m.toStr.size < d) break
        nums.add(m)
        m *= n
      }
    }
    res := nums.unique.size
    echo(res)
  }
}

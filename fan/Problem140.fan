class Problem140 {
  Void main() {
    res := solve(30)
    echo(res)
  }

  Decimal solve(Int n) {
    base := [[0D, -1D], [0D, 1D], [-3D, -2D], [-3D, 2D], [-4D, -5D], [-4D, 5D], [2D, -7D], [2D, 7D]]
    Decimal[][] solutions := [,]
    for (i := 0; i < base.size; i++) {
      cur := base[i]
      n.times {
        if (!solutions.contains(cur)) {
          solutions.add(cur)
        }
        cur = next(cur)
      }
    }
    ns := solutions.map { it[0] }.findAll { it > 0D }.unique.sort
    return sum(ns[0..<30])
  }

  Decimal sum(Decimal[] list) {
    return list.reduce(0D, |Decimal a, Decimal b -> Decimal| { a + b })
  }

  Decimal[] next(Decimal[] solution) {
    x := solution[0]
    y := solution[1]
    return [-9 * x - 4 * y - 14, -20 * x - 9 * y - 28]
  }
}

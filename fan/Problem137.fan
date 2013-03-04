class Problem137 {
  Void main() {
    solutions := [[3D, 1D], [18D, 8D]]
    seen := [:] { def = false }
    seen[solutions[0].toImmutable] = true
    seen[solutions[1].toImmutable] = true
    idx := 0
    15.times {
      solution := solutions[idx++]
      l := solution[0]
      p := solution[1]

      l1 := 9 * l + 20 * p
      p1 := 4 * l + 9 * p
      l2 := 9 * l - 20 * p
      p2 := 4 * l - 9 * p

      if (!seen[[l1, p1]] && calcN(l1, p1) > 0D) {
        solutions.add([l1, p1])
        seen[[l1, p1].toImmutable] = true
      }
      if (!seen[[l2, p2]] && calcN(l2, p2) > 0D) {
        solutions.add([l2, p2])
        seen[[l2, p2].toImmutable] = true
      }
    }

    res := solutions.map { calcN(it[0], it[1]) }.sort[14]
    echo(res)
  }

  Decimal calcN(Decimal l, Decimal p) {
    return p * (l + p) / 2
  }
}

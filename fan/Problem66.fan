class Problem66 {
  Void main() {
    minSolutions := (1..1000).map { minSolution(it) }
    maxMinSolution := minSolutions.max
    res := minSolutions.findIndex { it == maxMinSolution } + 1
    echo(res)
  }

  Decimal minSolution(Int n) {
    seq := Int[,]
    a := n
    b := 0
    while (true) {
      x := (a / (n.toFloat.sqrt + b)).floor.toInt
      seq.add(x)
      na := (n - b * b) / a
      nb := -x * (n - b * b) / a - b
      a = na
      b = nb
      if (a == 0) return 0D
      frac := contFrac(seq)
      if (frac.n * frac.n - n * frac.d * frac.d == 1D) return frac.n
    }
    throw Err()
  }

  DecFrac contFrac(Int[] spec) {
    if (spec.isEmpty) throw ArgErr(spec.toStr)
    res := DecFrac(spec.last)
    if (spec.size > 1) {
      spec[0..spec.size - 2].reverse.each |n| {
        res = DecFrac(n) + DecFrac(1) / res
      }
    }
    return res
  }
}

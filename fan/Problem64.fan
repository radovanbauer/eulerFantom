class Problem64 {
  Void main() {
    odd := 0
    (1..10_000).each |n| {
      seq := Int[][,]
      a := n
      b := 0
      while (true) {
        seq.add([a, b])
        x := (a / (n.toFloat.sqrt + b)).floor.toInt
        na := (n - b * b) / a
        nb := -x * (n - b * b) / a - b
        a = na
        b = nb
        if (a == 0) break
        if (seq.contains([a, b])) {
          period := seq.size - seq.findIndex { it == [a, b] }
          if (period % 2 == 1) odd++
          break
        }
      }
    }
    echo(odd)
  }
}

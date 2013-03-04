class Problem144 {
  Void main() {
    x1 := 0F
    y1 := 10.1F
    x := 1.4F
    y := -9.6F
    cnt := 0
    while (!(y > 0F && x.abs <= 0.01F)) {
      m1 := (y1 - y) / (x1 - x)
      m := y / (4 * x)
      t := (m - m1) / (m1 * m + 1)
      m2 := (m + t) / (1 - m * t)
      x2s := solveQuadratic(4 + m2*m2, 2*m2*y - 2*m2*m2*x, m2*m2*x*x + y*y - 2*m2*x*y - 100)
      x2 := 0F
      if ((x2s[0] - x).abs > (x2s[1] - x).abs) {
        x2 = x2s[0]
      } else {
        x2 = x2s[1]
      }
      y2 := m2*(x2 - x) + y
      x1 = x
      y1 = y
      x = x2
      y = y2
      cnt++
    }
    echo(cnt)
  }

  Float[] solveQuadratic(Float a, Float b, Float c) {
    d := (b * b - 4 * a * c).sqrt
    return [(-b + d) / (2 * a), (-b - d) / (2 * a)]
  }
}

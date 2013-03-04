class Problem147 {
  Void main() {
    res := solve(47, 43)
    echo(res)
  }

  Int solve(Int maxa, Int maxb) {
    cnt := 0
    for (a := 1; a <= maxa; a++) {
      for (b := 1; b <= maxb; b++) {
        cnt += num(a, b)
      }
    }
    return cnt
  }

  Int num(Int a, Int b) {
    return numOrtho(a, b) + numDiag(a, b)
  }

  Int numOrtho(Int a, Int b) {
    return a * (a + 1) * b * (b + 1) / 4;
  }

  Int numDiag(Int a, Int b) {
    cnt := 0
    for (x1 := 0; x1 <= 2*a; x1++) {
      for (y1 := x1 % 2; y1 <= 2*b; y1 += 2) {
        x2 := x1 + 1
        y2 := y1 - 1
        while (x2 <= 2*a && y2 >= 0) {
          x3 := x1 + 1
          y3 := y1 + 1
          while (x3 <= 2*a && y3 <= 2*b) {
            x4 := x1 + (x2 - x1) + (x3 - x1)
            y4 := y1 + (y2 - y1) + (y3 - y1)
            if (x4 >= 0 && x4 <= 2*a && y4 >= 0 && y4 <= 2*b) {
              cnt++
            }
            x3++
            y3++
          }
          x2++
          y2--
        }
      }
    }
    return cnt
  }
}

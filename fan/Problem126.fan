class Problem126 {
  Void main() {
    Int:Int ways := [:] { def = 0 }
    max := 100000
    for (a := 1; l(a, a, a, 1) <= max; a++) {
      for (b := a; l(a, b, b, 1) <= max; b++) {
        for (c := b; l(a, b, c, 1) <= max; c++) {
          for (n := 1; l(a, b, c, n) <= max; n++) {
            ways[l(a, b, c, n)]++
          }
        }
      }
    }
    res := (1..max).toList.find { ways[it] == 1000 }
    echo(res)
  }

  Int l(Int a, Int b, Int c, Int n) {
    return 4*n*n + 4*n*(a+b+c-3) + 2*(a*b+a*c+b*c) - 4*(a+b+c) + 8
  }
}

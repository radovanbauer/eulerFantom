class Problem138 {
  Void main() {
    Int[][] solutions := [,]
    for (m := 1; solutions.size < 12; m++) {
      n := -2*m + (5*m*m - 1).toFloat.sqrt.round.toInt
      if (n > 0 && n*n + 4*m*n - m*m + 1 == 0) {
        solutions.add(solution(m, n))
      }
      n = -2*m + (5*m*m + 1).toFloat.sqrt.round.toInt
      if (n > 0 && n*n + 4*m*n - m*m - 1 == 0) {
        solutions.add(solution(m, n))
      }
    }
    res := sum(solutions.map { it[2] })
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Int[] solution(Int m, Int n) {
    return [m*m - n*n, 2*m*n, m*m + n*n]
  }
}

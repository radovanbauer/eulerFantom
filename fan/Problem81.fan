class Problem81 {
  Void main() {
    Int[][] matrix := (`fan://eulerFantom/res/matrix.txt`.get as File)
        .readAllLines
        .map { it.split(',').map { it.toInt } }
    n := matrix.size
    m := matrix[0].size
    Int[][] minSum := (0..<n).map { (0..<m).map { 0 } }
    n.times |x| {
      m.times |y| {
        Int[] a := (x > 0 ? [minSum[x - 1][y]] : [,]).addAll(y > 0 ? [minSum[x][y - 1]] : [,])
        minSum[x][y] = matrix[x][y] + (a.isEmpty ? 0 : a.min)
      }
    }
    res := minSum[n - 1][m - 1]
    echo(res)
  }
}

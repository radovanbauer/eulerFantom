class Problem82 {
  Void main() {
    Int[][] matrix := (`fan://eulerFantom/res/matrix.txt`.get as File)
        .readAllLines
        .map { it.split(',').map { it.toInt } }
    n := matrix.size
    m := matrix[0].size
    Int[][] minSum := (0..<n).map { (0..<m).map { 0 } }
    for (x := 0; x < n; x++) {
      minSum[x][0] = matrix[x][0]
    }
    for (y := 0; y < m; y++) {
      for (x := 0; x < n; x++) {
        minSum[x][y] = minSum[x][y - 1] + matrix[x][y]
      }
      for (x := 1; x < n; x++) {
        minSum[x][y] = minSum[x][y].min(minSum[x - 1][y] + matrix[x][y])
      }
      for (x := n - 2; x >= 0; x--) {
        minSum[x][y] = minSum[x][y].min(minSum[x + 1][y] + matrix[x][y])
      }
    }
    res := (0..<n).map |x| { minSum[x][m - 1] }.min
    echo(res)
  }
}

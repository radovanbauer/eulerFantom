class Problem67 {
  Void main() {
    Int[][] triangle := (`fan://eulerFantom/res/triangle.txt`.get as File)
        .readAllStr
        .splitLines
        .exclude { it == "" }
        .map { it.split.map { it.toInt } }
    n := triangle.size
    Int[][] maxSum := (0..n).map { (0..n).map { 0 } }
    for (x := 1; x <= n; x++) {
      for (y := 1; y <= x; y++) {
        maxSum[x][y] = maxSum[x - 1][y].max(maxSum[x - 1][y - 1]) + triangle[x - 1][y - 1]
      }
    }
    res := maxSum[n].max
    echo(res)
  }
}

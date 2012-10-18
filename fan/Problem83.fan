class Problem83 {
  Void main() {
    Int[][] matrix := (`fan://eulerFantom/res/matrix.txt`.get as File)
        .readAllLines
        .map { it.split(',').map { it.toInt } }
    n := matrix.size
    m := matrix[0].size
    edges := [,]
    edge := |Int x1, Int y1, Int x2, Int y2 -> Int[]| { [x1 * m + y1, x2 * m + y2, matrix[x2][y2]] }
    (0..<n).each |x| {
      (0..<m).each |y| {
        if (inBounds(x - 1, y, n, m)) edges.add(edge(x, y, x - 1, y))
        if (inBounds(x, y - 1, n, m)) edges.add(edge(x, y, x, y - 1))
        if (inBounds(x + 1, y, n, m)) edges.add(edge(x, y, x + 1, y))
        if (inBounds(x, y + 1, n, m)) edges.add(edge(x, y, x, y + 1))
      }
    }
    dist := bellmanFord(n * m, 0, edges)
    res := dist[n * m - 1] + matrix[0][0]
    echo(res)
  }

  Bool inBounds(Int x, Int y, Int n, Int m) {
    return x >= 0 && x < n && y >= 0 && y < m
  }

  Int[] bellmanFord(Int vertices, Int source, Int[][] edges) {
    Int[] dist := (0..<vertices).map { Int.maxVal }
    dist[source] = 0
    changed := true
    while (changed) {
      changed = false
      edges.each |edge| {
        u := edge[0]
        v := edge[1]
        weight := edge[2]
        if (dist[u] < dist[v] - weight) {
          dist[v] = dist[u] + weight
          changed = true
        }
      }
    }
    return dist
  }
}

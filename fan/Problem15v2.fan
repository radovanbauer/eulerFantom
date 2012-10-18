class Problem15v2 {
  Void main() {
    Int[][] ways := (0..20).map { (0..20).map { 0 } }
    for (i := 0; i <= 20; i++) {
      ways[0][i] = 1
      ways[i][0] = 1
    }
    for (x := 1; x <= 20; x++) {
      for (y := 1; y <= 20; y++) {
        ways[x][y] = ways[x - 1][y] + ways[x][y - 1]
      }
    }
    echo(ways[20][20])
  }
}

class Problem28 {
  Void main() {
    n := 1001
    spiral := spiral(n)
    sum := 0
    (0..<n).each |x| {
      (0..<n).each |y| {
        if (x == y || x + y == n - 1) {
          sum += spiral[x][y]
        }
      }
    }
    echo(sum)
  }

  Int[][] spiral(Int n) {
    if (n < 0 || n % 2 == 0) throw ArgErr()
    Int[][] spiral := (0..<n).map { (0..<n).map { 0 } }
    Int[][] dirs := [[0, 1], [1, 0], [0, -1], [-1, 0]]
    Int x := n / 2
    Int y := n / 2
    Int num := 1
    Int dir := 3
    while (inBounds(x, y, n)) {
      spiral[x][y] = num++
      rightDir := (dir + 1) % 4
      rightX := x + dirs[rightDir][0]
      rightY := y + dirs[rightDir][1]
      if (inBounds(rightX, rightY, n) && spiral[rightX][rightY] == 0) {
        dir = rightDir
      }
      x = x + dirs[dir][0]
      y = y + dirs[dir][1]
    }
    return spiral
  }

  Void print(Int[][] spiral) {
    spiral.each { echo(it.join(" ")) }
  }

  Bool inBounds(Int x, Int y, Int n) {
    return (0..<n).contains(x) && (0..<n).contains(y)
  }
}

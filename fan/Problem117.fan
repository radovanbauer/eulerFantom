class Problem117 {
  Void main() {
    res := numTiles(50)
    echo(res)
  }

  Int numTiles(Int n) {
    Int:Int ways := [:]
    ways[0] = 1
    ways[1] = 1
    ways[2] = 2
    ways[3] = 4
    if (n >= 4) {
      (4..n).each |k| { ways[k] = ways[k - 1] + ways[k - 2] + ways[k - 3] + ways[k - 4] }
    }
    return ways[n]
  }
}

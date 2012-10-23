class Problem116 {
  Void main() {
    res := numTiles(50, 2) + numTiles(50, 3) + numTiles(50, 4)
    echo(res)
  }

  Int numTiles(Int n, Int d) {
    Int:Int ways := [:]
    (0..d - 1).each { ways[it] = 0 }
    if (n >= d) {
      (d..n).each |k| { ways[k] = ways[k - 1] + ways[k - d] + 1 }
    }
    return ways[n]
  }
}

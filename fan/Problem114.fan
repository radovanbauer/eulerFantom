class Problem114 {
  Void main() {
    echo(solve(50))
  }

  Int solve(Int n) {
    Int[] ways := (0..n).map { 0 }
    ways[0] = 1
    ways[1] = 1
    ways[2] = 1
    ways[3] = 2
    (4..n).each |k| {
      ways[k] = 2 * ways[k - 1] - ways[k - 2] + ways[k - 4]
    }
    return ways[n]
  }
}

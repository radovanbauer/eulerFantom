class Problem115 {
  Void main() {
    res := solve(50)
    echo(res)
  }

  Int solve(Int d) {
    Int:Int ways := [:]
    ways[-1] = 1
    ways[0] = 1
    for (n := 1;; n++) {
      ways[n] = 2 * ways[n - 1] - ways[n - 2]
      if (n >= d) {
        ways[n] += ways[n - d - 1]
      }
      if (ways[n] > 1_000_000) {
        return n
      }
    }
    throw Err()
  }
}

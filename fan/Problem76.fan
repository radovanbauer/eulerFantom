class Problem76 {
  Void main() {
    Int[][] ways := [,]
    ways.add([1])
    (1..100).each |n| {
      ways.add([0])
      (1..n).each |k| {
        ways[n].add(ways[n][k - 1] + (n >= k ? ways[n - k][k.min(n - k)] : 0))
      }
    }
    res := ways[100][99]
    echo(res)
  }
}

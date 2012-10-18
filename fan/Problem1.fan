class Problem1 {
  Void main() {
    res := (1..<1000)
        .toList
        .findAll { it % 3 == 0 || it % 5 == 0 }
        .reduce(0, |Int a, Int b -> Int| { a + b })
    echo(res)
  }
}

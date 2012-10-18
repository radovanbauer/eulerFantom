class Problem92 {
  Void main() {
    cnt := 0
    (1..<10_000_000).each { if (find(it) == 89) cnt++ }
    echo(cnt)
  }

  Int find(Int n) {
    if (n == 1 || n == 89) return n
    return find(sum(n.toStr.chars.map { it.fromDigit.pow(2) }))
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

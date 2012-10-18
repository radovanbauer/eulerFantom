class Problem74 {
  Void main() {
    res := (1..<1_000_000).map { size([it]) }.findAll { it == 60 }.size
    echo(res)
  }

  Int size(Int[] chain) {
    next := sum(chain.last.toStr.chars.map { facts[it.fromDigit] })
    if (chain.contains(next)) {
      return 1
    } else {
      return 1 + size(chain.add(next))
    }
  }

  static const Int[] facts := (0..9).map { fact(it) }

  static Int fact(Int d) {
    return d == 0 ? 1 : d * fact(d - 1)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

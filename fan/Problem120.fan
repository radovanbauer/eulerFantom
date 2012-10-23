class Problem120 {
  Void main() {
    res := sum((3..1000).map { rmax(it) })
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Int rmax(Int a) {
    if (a < 3) throw ArgErr()
    if (a % 2 == 0) {
      return a * a - 2 * a
    } else {
      return a * a - a
    }
  }
}

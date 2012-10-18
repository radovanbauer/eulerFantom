class Problem40 {
  Void main() {
    str := (1..1_000_000).toList.join
    res := prod((0..6).map { str[10.pow(it) - 1].fromDigit })
    echo(res)
  }

  Int prod(Int[] list) {
    return list.reduce(1, |Int a, Int b -> Int| { a * b })
  }
}

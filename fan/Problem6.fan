class Problem6 {
  Void main() {
    Int sumOfSquares := (1..100).map { it * it }.reduce(0, |Int a, Int b -> Int| { a + b })
    Int sum := (1..100).toList.reduce(0, |Int a, Int b -> Int| { a + b })
    Int squareOfSum := sum * sum
    res := squareOfSum - sumOfSquares
    echo(res)
  }
}

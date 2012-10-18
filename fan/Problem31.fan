class Problem31 {
  Void main() {
    n := 200
    coins := [1, 2, 5, 10, 20, 50, 100, 200]
    Int[][] ways := (0..n).map { (0..<coins.size).map { 0 } }
    coins.each |coin, coinIdx| { ways[coin][coinIdx] = 1 }
    (1..n).each |val| {
      coins.each |coin, coinIdx| {
        if (val - coin >= 0) {
          (0..coinIdx).each |smallerCoinIdx| {
            ways[val][coinIdx] += ways[val - coin][smallerCoinIdx]
          }
        }
      }
    }
    res := sum(ways[n])
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

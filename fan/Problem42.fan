class Problem42 {
  Void main() {
    res := (`fan://eulerFantom/res/words.txt`.get as File)
        .readAllStr
        .replace("\"", "")
        .split(',')
        .findAll { isTriangle(sum(it.chars.map { it - 'A' + 1 })) }
        .size
    echo(res)
  }

  Bool isTriangle(Int t) {
    return (((1 + 8 * t).toFloat.sqrt - 1) / 2) % 1 == 0F
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

class Problem125 {
  Void main() {
    res := solve(10.pow(8))
    echo(res)
  }

  Int solve(Int n) {
    Int[] partialSums := (0..n.toFloat.sqrt.ceil.toInt)
        .map { it * (it + 1) * (2 * it + 1) / 6 }
    sums := [,]
    for (i := 2; i < partialSums.size; i++) {
      for (j := i - 2; j >= 0; j--) {
        diff := partialSums[i] - partialSums[j]
        if (diff >= n) break
        sums.add(diff)
      }
    }
    sums = sums.unique
    return sum(sums.findAll { isPalindrome(it) })
  }

  Bool isPalindrome(Int n) {
    return n.toStr.reverse == n.toStr
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

class Problem105 {
  Void main() {
    Int[][] sets := (`fan://eulerFantom/res/sets.txt`.get as File)
        .readAllLines
        .map { it.split(',').map { it.toInt } }
    res := sum(sets.findAll { isSpecialSumSet(it) }.map { sum(it) })
    echo(res)
  }

  Bool isSpecialSumSet(Int[] set) {
    if (set.isEmpty) throw ArgErr()
    set = set.sort
    sum1 := set[0]
    sum2 := 0
    for (i := 1; i < (set.size + 1) / 2; i++) {
      sum1 += set[i]
      sum2 += set[-i]
      if (sum1 <= sum2) return false
    }
    sums := Int:Bool[:]
    for (mask := 1; mask < 1.shiftl(set.size); mask++) {
      sum := 0
      for (i := 0; i < set.size; i++) {
        if (1.shiftl(i).and(mask) > 0) {
          sum += set[i]
        }
      }
      if (sums.containsKey(sum)) {
        return false
      } else { 
        sums[sum] = true
      }
    }
    return true
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

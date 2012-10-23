class Problem121 {
  Void main() {
    res := (DecFrac(1) / prob(15)).toFloat.floor.toInt
    echo(res)
  }

  DecFrac prob(Int rounds) {
    winMasks := (0..<1.shiftl(rounds)).toList.findAll { binOnes(it) * 2 > rounds }
    return DecFrac.sum(winMasks.map |winMask| {
        DecFrac.prod((0..<rounds).map |round| {
            1.shiftl(round).and(winMask) > 0
                ? DecFrac(1, round + 2)
                : DecFrac(round + 1, round + 2)
        })
    })
  }

  Int binOnes(Int n) {
    cnt := 0
    while (n > 0) {
      if (n.and(1) == 1) cnt++
      n = n.shiftr(1)
    }
    return cnt
  }
}

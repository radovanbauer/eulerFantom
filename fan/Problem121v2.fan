class Problem121v2 {
  Void main() {
    rounds := 15
    Int[]:DecFrac probs := [:] { def = DecFrac.zero }
    probs[[0, 0].toImmutable] = DecFrac.one
    (1..rounds).each |round| {
      pRoundWin := DecFrac(1, round + 1)
      pRoundLoss := DecFrac.one - pRoundWin
      (0..round).each |wins| {
        probs[[round, wins].toImmutable] = pRoundLoss * probs[[round - 1, wins]]
        if (wins > 0) {
          probs[[round, wins].toImmutable] += pRoundWin * probs[[round - 1, wins - 1]]
        }
      }
    }
    probWin := DecFrac.sum((rounds / 2 + 1..rounds).map |wins| { probs[[rounds, wins]] })
    res := (DecFrac.one / probWin).toFloat.floor.toInt
    echo(res)
  }
}

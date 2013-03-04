class Problem151 {
  Void main() {
    Int[][] states := [[1, 0, 0, 0, 0]]
    Int[]:Float prob := [:]
    prob[[1, 0, 0, 0, 0].toImmutable] = 1F
    while (!states.isEmpty) {
      Int[][] nextStates := [,]
      states.each |state| {
        sheets := sum(state)
        for (k := 0; k < 5; k++) {
          if (state[k] > 0) {
            next := state.dup
            next[k]--
            for (l := k + 1; l < 5; l++) {
              next[l]++
            }
            if (!prob.containsKey(next)) {
              nextStates.add(next)
            }
            prob[next.toImmutable] = prob.get(next, 0F) + prob[state] * (state[k].toFloat / sheets) 
          }
        }
      }
      states = nextStates
    }
    res := ((prob[[0, 1, 0, 0, 0]] + prob[[0, 0, 1, 0, 0]] + prob[[0, 0, 0, 1, 0]]) * 1e6F).round / 1e6F
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

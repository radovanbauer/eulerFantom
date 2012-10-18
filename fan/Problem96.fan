class Problem96 {
  Void main() {
    lines := (`fan://eulerFantom/res/sudoku.txt`.get as File)
        .readAllLines
        .exclude { it.contains("Grid") }
        .map { it.chars.map { it.fromDigit } }
    Int[][][] problems := (0..<lines.size / 9).map { lines[it * 9..<it * 9 + 9] }

    res := 0
    problems.each {
      sudoku := Sudoku(it)
      sudoku.solve
      res += sudoku.solution[0][0..2].join.toInt
    }
    echo(res)
  }
}

class Sudoku {
  Int[][][] state

  new make(Int[][] problem) {
    state = (0..<9).map |x| { (0..<9).map |y| { (1..9).toList } }
    (0..<9).each |x| {
      (0..<9).each |y| {
        if (problem[x][y] > 0) {
          state[x][y] = [problem[x][y]]
        }
      }
    }
  }

  This solve() {
    (0..<9).each |x| {
      (0..<9).each |y| {
        check([x, y])
      }
    }
    trySolve([0, 0])
    return this
  }

  Bool trySolve(Int[] pos) {
    if (pos == [9, 0]) return true
    nextPos := [pos[0] + (pos[1] % 9 == 8 ? 1 : 0), (pos[1] + 1) % 9]
    options := state[pos[0]][pos[1]]
    if (options.size == 0) throw Err()
    if (options.size == 1) return trySolve(nextPos)
    stateCopy := copyState(state).toImmutable
    return options.any |option| {
      state[pos[0]][pos[1]] = [option]
      if (!check(pos) || !trySolve(nextPos)) {
        state = copyState(stateCopy)
        return false
      }
      return true
    }
  }

  Int[][][] copyState(Int[][][] stateToCopy) {
    return stateToCopy.map { it.map { it.dup } }
  }

  Bool check(Int[] pos) {
    if (state[pos[0]][pos[1]].isEmpty) return false
    Int[][][] groups := groupsForPos[pos]
    Int[][] updated := [,]
    groups.each |group| {
      Int[][] stateGroup := group.map |groupPos| { state[groupPos[0]][groupPos[1]] }
      stateGroup.each |options1, idx1| {
        if (options1.size == 1) {
          single := options1.first
          stateGroup.each |options2, idx2| {
            if (idx1 != idx2 && options2.contains(single)) {
              options2.remove(single)
              updated.add(group[idx2])
            }
          }
        }
      }
    }
    return updated.all { check(it) }
  }

  once Int[]:Int[][][] groupsForPos() {
    Int[]:Int[][][] res := [:]
    groups.each |group| {
      group.each |pos| {
        if (!res.containsKey(pos)) {
          res[pos] = [,]
        }
        res[pos].add(group)
      }
    }
    return res.toImmutable
  }

  once Int[][][] groups() {
    res := [,]
    res.addAll((0..<9).map |a| { (0..<9).map |b| { [a, b] } })
    res.addAll((0..<9).map |a| { (0..<9).map |b| { [b, a] } })
    res.addAll((0..<9).map |a| { (0..<9).map |b| { [ a / 3 * 3 + b / 3, a % 3 * 3 + b % 3] } })
    return res.toImmutable
  }

  override Str toStr() {
    return state.map |line| { line.map { it.join.padl(9, ' ') }.join(" ") }.join("\n")
  }

  Bool isSolved() {
    return state.all { it.all { it.size == 1 } }
  }

  Int[][] solution() {
    if (!isSolved()) throw ArgErr()
    return state.map { it.map { it.first } }
  }
}

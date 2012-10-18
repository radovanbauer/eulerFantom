class Problem98 {
  Void main() {
    Str[] words := (`fan://eulerFantom/res/words.txt`.get as File)
        .readAllStr
        .replace("\"", "")
        .split(',')
    Int[]:Str[] groups := [:]
    words.each |word| {
      chars := word.chars.sort.toImmutable
      if (!groups.containsKey(chars)) {
        groups[chars] = [,]
      }
      groups[chars].add(word)
    }
    Str[][] anagrams := groups.findAll { it.size > 1 }.vals
    max := 0
    anagrams.each |anagram| {
      anagram.each |word1| {
        anagram.findAll {it != word1}.each |word2| {
          for (n := 1;; n++) {
            sq1 := n * n
            if (sq1.toStr.size < word1.size) continue
            if (sq1.toStr.size > word1.size) break
            assign := assign(word1, sq1)
            if (assign == null) continue
            sq2 := word2.chars.map { assign[it] }.join.toInt
            if (sq2.toStr.size == word2.size && isSquare(sq2)) {
              max = max.max(sq1).max(sq2)
            }
          }
        }
      }
    }
    echo(max)
  }

  [Int:Int]? assign(Str word, Int square) {
    if (word.size != square.toStr.size) throw ArgErr()
    assign := Int:Int[:]
    chars := word.chars
    for (c := 0; c < chars.size; c++) {
      digit := square.toStr[c].fromDigit
      if (assign.containsKey(chars[c])) {
        if (assign[chars[c]] != digit) {
          return null
        }
      } else {
        assign[chars[c]] = digit
      }
    }
    if (assign.vals.unique.size != assign.size) {
      return null
    }
    return assign
  }

  Bool isSquare(Int n) {
    return n >= 0 && n == n.toFloat.sqrt.round.toInt.pow(2)
  }
}

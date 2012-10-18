class Problem62 {
  Void main() {
    for (digitCount := 1;; digitCount++) {
      cubes := [,]
      for (i := 1; (i * i * i).toStr.size <= digitCount; i++) {
        if ((i * i * i).toStr.size == digitCount) {
          cubes.add(i * i * i)
        }
      }
      countBydigitCount := Str:Int[:] { def = 0 }
      cubes.each {
        countBydigitCount[Str.fromChars(it.toStr.chars.sort)]++
      }
      fives := countBydigitCount.findAll { it == 5 }.keys
      if (!fives.isEmpty) {
        res := cubes
            .findAll |chars, count| { fives.contains(Str.fromChars(chars.toStr.chars.sort)) }
            .min
        echo(res)
        return
      }
    }
  }
}

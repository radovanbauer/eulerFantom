class Problem86 {
  Void main() {
    count := 0
    for (a := 1;; a++) {
      for (b := 1; b <= a; b++) {
        for (c := 1; c <= b; c++) {
          if (isSquare(a * a + (b + c) * (b + c))) {
            count++
          }
        }
      }
      if (count >= 1_000_000) {
        echo(a)
        return
      }
    }
  }

  Bool isSquare(Int n) {
    return n.toFloat.sqrt % 1 == 0F
  }
}

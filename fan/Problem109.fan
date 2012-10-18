class Problem109 {
  Void main() {
    Int[][] vals := [,]
    vals.addAll((1..20).map { [1, it] })
    vals.addAll((1..20).map { [2, it * 2] })
    vals.addAll((1..20).map { [3, it * 3] })
    vals.add([1, 0])
    vals.add([1, 25])
    vals.add([2, 50])
    doubles := vals.findAll { it[0] == 2 }
    cnt := 0
    vals.each |val1, idx1| {
      vals.findAll |val2, idx2| { idx1 <= idx2 }.each |val2| {
        doubles.each |val3| {
          if (val1[1] + val2[1] + val3[1] < 100) {
            cnt++
          }
        }
      }
    }
    echo(cnt)
  }
}

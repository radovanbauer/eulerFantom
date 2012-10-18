class Problem89 {
  Void main() {
    res := sum((`fan://eulerFantom/res/roman.txt`.get as File)
        .readAllLines
        .map { it.size - encode(decode(it)).size })
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  static const Obj[][] vals := [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CM"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]]

  Str encode(Int n) {
    res := StrBuf()
    vals.each {
      Int val := it[0]
      Str str := it[1]
      while (n >= val) {
        res.add(str)
        n -= val
      }
    }
    return res.toStr
  }

  Int decode(Str roman) {
    sum := 0
    i := 0
    while (i < roman.size) {
      if (i + 1 < roman.size && translate(roman[i]) < translate(roman[i + 1])) {
        sum += translate(roman[i + 1]) - translate(roman[i])
        i += 2
      } else {
        sum += translate(roman[i])
        i += 1
      }
    }
    return sum
  }

  Int translate(Int letter) {
    switch (letter) {
      case 'M': return 1000
      case 'D': return 500
      case 'C': return 100
      case 'L': return 50
      case 'X': return 10
      case 'V': return 5
      case 'I': return 1
      default: throw Err()
    }
  }
}

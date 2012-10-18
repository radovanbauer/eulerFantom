class Problem59v2 {
  Void main() {
    cipher := Str.fromChars((`fan://eulerFantom/res/cipher1.txt`.get as File)
        .readAllStr
        .split(',')
        .map { it.toInt })
    keyLength := 3
    mostFrequentEnglishChar := ' '
    key := Str.fromChars((0..<keyLength)
        .map |i| { Str.fromChars(cipher.chars.findAll |c, idx| { idx % keyLength == i }) }
        .map { mostFrequent(it).xor(mostFrequentEnglishChar) })
    echo(sum(encode(cipher, key).chars))
  }

  Str encode(Str str, Str key) {
    return Str.fromChars(str.chars.map |char, idx| { char.xor(key[idx % key.size]) })
  }

  Int mostFrequent(Str str) {
    count := Int:Int[:] { def = 0 }
    str.chars.each { count[it]++ }
    max := count.vals.max
    return count.keys.find { count[it] == max }
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

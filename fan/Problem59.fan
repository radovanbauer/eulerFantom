class Problem59 {
  Void main() {
    cipher := Str.fromChars((`fan://eulerFantom/res/cipher1.txt`.get as File)
        .readAllStr
        .split(',')
        .map { it.toInt })
    keyChars := ('a'..'z')
    allKeys := keyChars
        .map |a| { keyChars.map |b| { keyChars.map |c| { Str.fromChars([a, b, c]) } } }
        .flatten
        .flatten
    englishTextPattern := Regex<|[a-zA-Z0-9!?.,;:$()_\-'" \t]*|>
    Str[] keys := allKeys.findAll { englishTextPattern.matches(encode(cipher, it)) }
    if (keys.size != 1) throw ArgErr()
    res := sum(encode(cipher, keys[0]).chars)
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }

  Str encode(Str str, Str key) {
    return Str.fromChars(str.chars.map |char, idx| { char.xor(key[idx % key.size]) })
  }
}

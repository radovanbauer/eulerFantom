class Problem22 {
  Void main() {
    res := (`fan://eulerFantom/res/names.txt`.get as File)
        .readAllStr
        .replace("\"", "")
        .split(',')
        .sort
        .map |name, idx| { value(name) * (idx + 1) }
        .reduce(0, |Int a, Int b -> Int| { a + b })
    echo(res)
  }

  Int value(Str name) {
    res := 0
    name.each { res += it - 'A' + 1 }
    return res
  }
}

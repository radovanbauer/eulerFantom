class Problem26 {
  Void main() {
    Int[] max := (1..<1000).map { [it, cycle(1, it)] }
        .max |Int[] a, Int[] b -> Int| {a[1] <=> b[1]}
    res := max[0]
    echo(res)
  }

  Int cycle(Int nom, Int den) {
    rem := (nom % den) * 10
    idx := 0
    Int:Int last := [:]
    while (true) {
      if (rem == 0) return 0
      if (last.containsKey(rem)) return idx - last.get(rem)
      last[rem] = idx
      rem = (rem % den) * 10
      idx++
    }
    throw Err()
  }
}

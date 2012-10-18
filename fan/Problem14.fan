class Problem14 {
  Void main() {
    Seq[] seqs := (1..<1_000_000).map { Seq(it) }
    Seq maxSeq := seqs.max |Seq a, Seq b -> Int| { a.size <=> b.size }
    echo(maxSeq.start)
  }
}

const class Seq {
  const Int start
  const Int size

  new make(Int start) {
    this.start = start
    this.size = calcSize(start)
  }

  static Int calcSize(Int start) {
    n := start
    size := 1
    while (n > 1) {
      n = n % 2 == 0 ? n / 2 : 3 * n + 1
      size++
    }
    return size
  }
}

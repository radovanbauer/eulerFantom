class Problem57 {
  Void main() {
    count := 0
    f := DecFrac(3, 2)
    1000.times |idx| {
      if (f.n.toStr.size > f.d.toStr.size) count++
      f = DecFrac(1) / (f + DecFrac(1)) + DecFrac(1)
    }
    echo(count)
  }
}

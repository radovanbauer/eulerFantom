class Problem112 {
  Void main() {
    bouncy := 0
    for (n := 1;; n++) {
      if (isBouncy(n)) bouncy++
      if (bouncy * 100 == n * 99) {
        echo(n)
        return
      }
    }
  }

  Bool isBouncy(Int n) {
    nChars := n.toStr.chars
    return nChars
        .map |c, idx| { idx == nChars.size - 1 ? 0 : c <=> nChars[idx + 1] }
        .containsAll([-1, 1])
  }
}

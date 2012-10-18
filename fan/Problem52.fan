class Problem52 {
  Void main() {
    for (n := 1;; n++) {
      if ((1..6).map { (n * it).toStr.chars.sort }.unique.size == 1) {
        echo(n)
        return
      }
    }
  }
}

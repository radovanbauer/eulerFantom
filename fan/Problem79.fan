class Problem79 {
  Void main() {
    logs := (`fan://eulerFantom/res/keylog.txt`.get as File)
        .readAllLines
        .map { it.chars }
    for (d := 1D;; d++) {
      chars := d.toStr.chars
      if (logs.all { isSub(chars, it) }) {
        echo(d)
        return
      }
    }
  }

  Bool isSub(Int[] list, Int[] sub) {
    k := 0
    for (i := 0; i < list.size; i++) {
      if (list[i] == sub[k]) {
        if (++k == sub.size) {
          return true
        }
      }
    }
    return false
  }
}

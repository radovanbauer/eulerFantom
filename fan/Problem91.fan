class Problem91 {
  Void main() {
    cnt := 0
    n := 50
    (0..n).each |x1| {
      (0..n).each |x2| {
        (0..n).each |y1| {
          (0..n).each |y2| {
            if ((x1 == 0 && y1 == 0) || (x2 == 0 && y2 == 0) || (x1 == x2 && y1 == y2)) return
            if (x1 * x2 + y1 * y2 == 0 || x1 * (x2 - x1) + y1 * (y2 - y1) == 0 || x2 * (x1 - x2) + y2 * (y1 - y2) == 0) {
              cnt++
            }
          }
        }
      }
    }
    echo(cnt / 2)
  }
}

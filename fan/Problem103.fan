class Problem103 {
  Void main() {
    Int min := 256
    Str res := ""
    for (a := 1; a * 7 < min; a++) {
      for (b := a + 1; a + 6 * b < min; b++) {
        for (c := b + 1; a + b + 5 * c < min && a + b > c; c++) {
          for (d := c + 1; a + b + c + 4 * d < min && a + b > d; d++) {
            for (e := d + 1; a + b + c + d + 3 * e < min && a + b > e && a + b + c > d + e; e++) {
              for (f := e + 1; a + b + c + d + e + 2 * f < min && a + b > f && a + b + c > e + f; f++) {
                for (g := f + 1; a + b + c + d + e + f + g < min && a + b > g && a + b + c > f + g && a + b + c + d > e + f + g; g++) {
                  set := [a, b, c, d, e, f, g]
                  sums := Bool[,] { fill(false, min) }
                  subsetNum := 1.shiftl(set.size)
                  for (mask := 1; mask < subsetNum; mask++) {
                    sum := 0
                    for (i := 0; i < set.size; i++) {
                      if (1.shiftl(i).and(mask) > 0) {
                        sum += set[i]
                      }
                    }
                    if (sums[sum]) {
                      break
                    } else if (mask == subsetNum - 1) {
                      min = sum
                      res = set.join
                    } else {
                      sums[sum] = true
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    echo(res)
  }
}

class Problem150 {
  Void main() {
    t := 0
    Int[] s := [,]
    for (k := 1; k <= 500500; k++) {
      t = (615949 * t + 797807) % 2.pow(20)
      s.add(t - 2.pow(19))
    }
    Int[][] sums := [,]
    len := 1
    start := 0
    while (start < s.size) {
      sum := [0]
      for (k := 0; k < len; k++) {
        sum.add(sum[k] + s[start + k])
      }
      start += len
      len++
      sums.add(sum)
    }
    Int min := 0
    Int[][] trisums := [,]
    for (n := 0; n < sums.size; n++) {
      Int[][] nexttrisums := [,]
      for (k := 0; k <= n; k++) {
        trisum := [,]
        for (l := 0; l <= k; l++) {
          if (k == l) {
            trisum.add(sums[n][k + 1] - sums[n][l])
          } else {
            trisum.add(sums[n][k + 1] - sums[n][l] + trisums[k - 1][l])
          }
        }
        min = min.min(trisum.min)
        nexttrisums.add(trisum)
      }
      trisums = nexttrisums
    }
    echo(min)
  }
}

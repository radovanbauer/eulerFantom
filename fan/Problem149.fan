class Problem149 {
  Void main() {
    s := [0]
    for (k := 1; k <= 55; k++) {
      s.add((100003 - 200003 * k + 300007 * k * k * k) % 1000000 - 500000)
    }
    for (k := 56; k <= 4000000; k++) {
      s.add((s[k - 24] + s[k - 55] + 1000000) % 1000000 - 500000)
    }
    max := 0
    Int[] hor := (1..2000).map { 0 }
    Int[] ver := (1..2000).map { 0 }
    Int[] diag := (1..2000).map { 0 }
    Int[] adiag := (1..2000).map { 0 }
    for (n := 0; n < 2000; n++) {
      Int[] nexthor := (1..2000).map { 0 }
      Int[] nextver := (1..2000).map { 0 }
      Int[] nextdiag := (1..2000).map { 0 }
      Int[] nextadiag := (1..2000).map { 0 }
      for (k := 0; k < 2000; k++) {
        cur := s[2000 * n + k + 1]
        nexthor[k] = cur
        nextver[k] = cur
        nextdiag[k] = cur
        nextadiag[k] = cur
        if (k > 0) {
          nexthor[k] = nexthor[k].max(cur + nexthor[k - 1])
          nextdiag[k] = nextdiag[k].max(cur + diag[k - 1])
        }
        nextver[k] = nextver[k].max(cur + ver[k])
        if (k + 1 < 2000) {
          nextadiag[k] = nextadiag[k].max(cur + diag[k + 1])
        }
      }
      hor = nexthor
      ver = nextver
      diag = nextdiag
      adiag = nextadiag
      max = max.max(hor.max).max(ver.max).max(diag.max).max(adiag.max)
    }
    echo(max)
  }
}

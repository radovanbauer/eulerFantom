using util

class Problem84 {
  Void main() {
    dice := 4
    pos := 0
    doubles := 0
    rand := Random.makeSeeded
    Int[] count := (0..39).map { 0 }
    10_000_000.times {
      roll1 := rand.next(1..dice)
      roll2 := rand.next(1..dice)
      pos = (pos + roll1 + roll2) % 40

      if (roll1 == roll2) {
        doubles++
      } else {
        doubles = 0
      }
      if (doubles == 3) {
        pos = 10
        doubles = 0
      }

      switch (pos) {
        case 30:
          pos = 10
        case 2:
        case 17:
        case 33:
          switch (rand.next(1..16)) {
            case 1: pos = 0
            case 2: pos = 10
          }
        case 7:
        case 22:
        case 36:
          switch (rand.next(1..16)) {
            case 1: pos = 0
            case 2: pos = 10
            case 3: pos = 11
            case 4: pos = 24
            case 5: pos = 39
            case 6: pos = 5
            case 7: while (pos % 5 != 0) pos = (pos + 1) % 40
            case 8: while (pos % 5 != 0) pos = (pos + 1) % 40
            case 9: while (pos != 12 && pos != 28) pos = (pos + 1) % 40
            case 10:
              pos = (pos + 37) % 40
              if (pos == 33) {
                switch (rand.next(1..16)) {
                  case 1: pos = 0
                  case 2: pos = 10
                }
              }
          }
      }

      count[pos]++
    }

    res := count
        .map |val, idx| { [val, idx] }
        .sortr |Int[] a, Int[] b -> Int| { a[0] <=> b[0] } [0..2]
        .map |Int[] a -> Str| { a[1].toStr.padl(2, '0') }
        .join
    echo(count)
    echo(res)
  }
}

class Problem61 {
  Void main() {
    functions := [
        |Int n -> Int| { n * (n + 1) / 2 },
        |Int n -> Int| { n * n },
        |Int n -> Int| { n * (3 * n - 1) / 2 },
        |Int n -> Int| { n * (2 * n - 1) },
        |Int n -> Int| { n * (5 * n - 3) / 2 },
        |Int n -> Int| { n * (3 * n - 2) }]
    polyNums := functions
        .map |fun| { (1..1_000).toList.map { fun(it) }.findAll { (1000..9999).contains(it) } }
        .map |Int[] nums, idx| { nums.map |num| { PolyNum(num, idx + 3) } }
        .flatten
    polyNumsByPrefix := Str:PolyNum[][:]
    polyNums.each {
      prefix := it.toStr[0..1]
      if (!polyNumsByPrefix.containsKey(prefix)) {
        polyNumsByPrefix[prefix] = [it]
      } else {
        polyNumsByPrefix[prefix].add(it)
      }
    }
    res := sum(find([,], polyNumsByPrefix).map { it.val })
    echo(res)
  }

  PolyNum[]? find(PolyNum[] nums, Str:PolyNum[] polyNumsByPrefix) {
    if (nums.size == 6) {
      if (nums.first.val.toStr[0..1] == nums.last.val.toStr[2..3]) {
        return nums
      } else {
        return null
      }
    }
    usedPoly := nums.map { it.poly }
    nextPrefixes := nums.isEmpty ? polyNumsByPrefix.keys : [nums.last.val.toStr[2..3]]
    res := null
    nextPrefixes.each |nextPrefix| {
      if (polyNumsByPrefix.containsKey(nextPrefix)) {
        polyNumsByPrefix[nextPrefix].each |next| {
          if (!usedPoly.contains(next.poly)) {
            found := find(nums.dup.add(next), polyNumsByPrefix)
            if (found != null) {
              res = found
            }
          }
        }
      }
    }
    return res
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

const class PolyNum {
  const Int val
  const Int poly

  new make(Int val, Int poly) {
    this.val = val
    this.poly = poly
  }

  override Str toStr() {
    return "$val:$poly"
  }
}

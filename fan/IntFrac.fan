const class IntFrac {
  const Int n
  const Int d

  static const IntFrac zero := IntFrac(0)
  static const IntFrac one := IntFrac(1)

  new make(Num n, Num d := 1) {
    nint := n.toInt
    dint := d.toInt
    if (dint == 0) throw ArgErr("$n/$d")
    if (dint < 0) {
      nint *= -1
      dint *= -1
    }
    gcd := gcd(nint.abs, dint.abs)
    this.n = nint / gcd
    this.d = dint / gcd
  }

  private Int gcd(Int a, Int b) {
    return b == 0 ? a : gcd(b, a % b)
  }

  @Operator IntFrac plus(IntFrac b) {
    return IntFrac(n * b.d + b.n * d, d * b.d)
  }

  @Operator IntFrac plusInt(Int b) {
    return plus(IntFrac(b))
  }

  @Operator IntFrac minus(IntFrac b) {
    return IntFrac(n * b.d - b.n * d, d * b.d)
  }

  @Operator IntFrac minusInt(Int b) {
    return minus(IntFrac(b))
  }

  @Operator IntFrac negate() {
    return IntFrac(-n, d)
  }

  @Operator IntFrac mult(IntFrac b) {
    return IntFrac(n * b.n, d * b.d)
  }

  @Operator IntFrac multInt(Int b) {
    return mult(IntFrac(b))
  }

  @Operator IntFrac div(IntFrac b) {
    return IntFrac(n * b.d, d * b.n)
  }

  @Operator IntFrac divInt(Int b) {
    return div(IntFrac(b))
  }

  override Int compare(Obj obj) {
    IntFrac b := obj
    return n * b.d <=> b.n * d
  }

  override Int hash() {
    return [n, d].hash
  }

  override Bool equals(Obj? obj) {
    if (obj is IntFrac) {
      IntFrac b := obj
      return n == b.n && d == b.d
    }
    return false
  }

  override Str toStr() {
    return d == 1 ? n.toStr : "$n/$d"
  }
}

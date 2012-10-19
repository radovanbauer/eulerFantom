const class DecFrac {
  const Decimal n
  const Decimal d

  static const DecFrac zero := DecFrac(0)
  static const DecFrac one := DecFrac(1)

  new make(Num n, Num d := 1) {
    ndec := n.toDecimal
    ddec := d.toDecimal
    if (ddec == 0D) throw ArgErr("$n/$d")
    gcd := gcd(ndec, ddec)
    this.n = ndec / gcd
    this.d = ddec / gcd
  }

  private Decimal gcd(Decimal a, Decimal b) {
    return b == 0D ? a : gcd(b, a % b)
  }

  @Operator DecFrac plus(DecFrac b) {
    return DecFrac(n * b.d + b.n * d, d * b.d)
  }

  @Operator DecFrac minus(DecFrac b) {
    return DecFrac(n * b.d - b.n * d, d * b.d)
  }

  @Operator DecFrac negate() {
    return DecFrac(-n, d)
  }

  @Operator DecFrac mult(DecFrac b) {
    return DecFrac(n * b.n, d * b.d)
  }

  @Operator DecFrac div(DecFrac b) {
    return DecFrac(n * b.d, d * b.n)
  }

  static DecFrac sum(DecFrac[] decFracs) {
    return decFracs.reduce(zero, |DecFrac acc, DecFrac frac -> DecFrac| { acc + frac })
  }

  static DecFrac prod(DecFrac[] decFracs) {
    return decFracs.reduce(one, |DecFrac acc, DecFrac frac -> DecFrac| { acc * frac })
  }

  override Int compare(Obj obj) {
    DecFrac b := obj
    return n * b.d <=> b.n * d
  }

  override Int hash() {
    return [n, d].hash
  }

  override Bool equals(Obj? obj) {
    if (obj is DecFrac) {
      DecFrac b := obj
      return n == b.n && d == b.d
    }
    return false
  }

  override Str toStr() {
    return d == 1D ? "$n" : "$n/$d"
  }
}

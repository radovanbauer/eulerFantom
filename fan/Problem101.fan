class Problem101 {
  Void main() {
    target := Poly.sum((0..10).map { Poly.x.pow(it) * (-1).pow(it) })
    res := DecFrac.sum((1..target.degree).map |n| { fit(target, n) }.findAll { it != null })
    echo(res)
  }

  DecFrac? fit(Poly poly, Int n) {
    op := lagrange((1..n).map { [DecFrac(it), poly.evalInt(it)] })
    if (op == poly) return null
    firstDiff := n
    while (op.evalInt(firstDiff) == poly.evalInt(firstDiff)) firstDiff++
    return op.evalInt(firstDiff)
  }

  Poly lagrange(DecFrac[][] points) {
    res := Poly.zero
    points.each |p1, idx1| {
      l := Poly(p1[1])
      points.findAll |p2, idx2| { idx1 != idx2 }.each |p2, idx2| {
        l *= (Poly.x - p2[0]) / (p1[0] - p2[0]) 
      }
      res += l
    }
    return res
  }
}

const class Poly {
  private const DecFrac[] coefs

  static const Poly zero := Poly(0)
  static const Poly one := Poly(1)
  static const Poly x := Poly([0, 1])

  new make(DecFrac[] coefs) {
    normalizedCoefs := coefs.dup
    while (!normalizedCoefs.isEmpty && normalizedCoefs.last == DecFrac.zero) {
      normalizedCoefs.removeAt(normalizedCoefs.size - 1)
    }
    if (normalizedCoefs.isEmpty) {
      normalizedCoefs = [DecFrac.zero]
    }
    this.coefs = normalizedCoefs
  }

  static new fromInts(Int[] coefs) {
    make(coefs.map { DecFrac(it) })
  }

  static new constantInt(Int constant) {
    constantDecFrac(DecFrac(constant))
  }

  static new constantDecFrac(DecFrac constant) {
    make([constant])
  }

  Int degree() {
    return coefs.size - 1
  }

  DecFrac evalInt(Int x) {
    return evalDecFrac(DecFrac(x))
  }

  DecFrac evalDecFrac(DecFrac x) {
    return coefs.dup.reverse
        .reduce(DecFrac.zero, |DecFrac acc, DecFrac coef -> DecFrac| { x * acc + coef })
  }

  @Operator Poly plus(Poly that) {
    return Poly.make((0..degree.max(that.degree)).map {
      coefs.getSafe(it, DecFrac.zero) + that.coefs.getSafe(it, DecFrac.zero)
    })
  }

  @Operator Poly plusInt(Int n) {
    return plus(Poly(n))
  }

  @Operator Poly plusDecFrac(DecFrac n) {
    return plus(Poly(n))
  }

  @Operator Poly negate() {
    return Poly.make(coefs.map { -it })
  }

  @Operator Poly minus(Poly that) {
    return plus(that.negate)
  }

  @Operator Poly minusInt(Int n) {
    return minus(Poly(n))
  }

  @Operator Poly minusDecFrac(DecFrac n) {
    return minus(Poly(n))
  }

  @Operator Poly mult(Poly that) {
    return Poly.make(
      (0..degree + that.degree).map |n| {
        coef := DecFrac.zero
        (0..n).each |k| {
          coef += coefs.getSafe(k, DecFrac.zero) * that.coefs.getSafe(n - k, DecFrac.zero)
        }
        return coef
    })
  }

  @Operator Poly multInt(Int n) {
    return mult(Poly(n))
  }

  @Operator Poly multDecFrac(DecFrac n) {
    return mult(Poly(n))
  }

  @Operator Poly divInt(Int n) {
    return mult(Poly(DecFrac.one / DecFrac(n)))
  }

  @Operator Poly divDecFract(DecFrac n) {
    return mult(Poly(DecFrac.one / n))
  }

  Poly pow(Int n) {
    res := one
    n.times {
      res *= this
      n--
    }
    return res
  }

  static Poly sum(Poly[] polys) {
    return polys.reduce(zero, |Poly acc, Poly poly -> Poly| { acc + poly })
  }

  override Int hash() {
    return coefs.hash
  }

  override Bool equals(Obj? obj) {
    if (obj is Poly) {
      Poly that := obj
      return coefs == that.coefs
    }
    return false
  }

  override Str toStr() {
    return coefs
        .map |coef, n| { termToStr(coef, n) }
        .exclude { it == "" }
        .reverse
        .join(" + ")
  }

  private Str termToStr(DecFrac coef, Int n) {
    nStr := null
    switch (n) {
      case 0: nStr = ""
      case 1: nStr = "x"
      default: nStr = "x^${n}"
    }
    switch (coef) {
      case DecFrac.zero: return ""
      case DecFrac.one: return nStr == "" ? "1" : nStr
      case -DecFrac.one: return nStr == "" ? "-1" : "-$nStr"
      default: return "$coef$nStr"
    }
  }
}
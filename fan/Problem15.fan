class Problem15 {
  Void main() {
    res := fact(40D) / fact(20D) / fact(20D)
    echo(res)
  }

  Decimal fact(Decimal d) {
    return d == 0D ? 1D : d * fact(d - 1D)
  }
}

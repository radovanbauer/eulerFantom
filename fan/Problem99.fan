class Problem99 {
  Void main() {
    Float[][] nums := (`fan://eulerFantom/res/base_exp.txt`.get as File)
        .readAllLines
        .map { it.split(',').map { it.toFloat } }
    exp := nums.map |pair, idx| { pair[1] * pair[0].log }
    res := exp.findIndex { it == exp.max } + 1
    echo(res)
  }

  Decimal pow(Num num, Int exp) {
    if (exp < 0) throw ArgErr()
    d := num.toDecimal
    res := 1D
    exp.times { res *= d }
    return res
  }
}

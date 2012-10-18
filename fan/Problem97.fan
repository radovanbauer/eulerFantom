class Problem97 {
  Void main() {
    res := 1
    7830457.times { res = res * 2 % 10.pow(10) }
    res = (res * 28433 + 1) % 10.pow(10)
    echo(res)
  }
}

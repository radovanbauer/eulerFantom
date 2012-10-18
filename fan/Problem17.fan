class Problem17 {
  Void main() {
    res := (1..1000).map { print(it) }.join.size
    echo(res)
  }

  static const Str[] ones := [
      "", "one", "two", "three", "four",
      "five", "six", "seven", "eight", "nine"]
  static const Str[] teens := [
      "ten", "eleven", "twelve", "thirteen", "fourteen",
      "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  static const Str[] tens := [
      "", "", "twenty", "thirty", "forty",
      "fifty", "sixty", "seventy", "eighty", "ninety"]

  Str print(Int n) {
    if (n >= 10000) {
      throw IndexErr()
    } else if (n >= 1000) {
      if (n % 1000 == 0) {
        return ones[n / 1000] + "thousand"
      } else {
        return ones[n / 1000] + "thousand" + print(n % 1000)
      }
    } else if (n >= 100) {
      if (n % 100 == 0) {
        return ones[n / 100] + "hundred"
      } else {
        return ones[n / 100] + "hundredand" + print(n % 100)
      }
    } else if (n >= 20) {
      if (n % 10 == 0) {
        return tens[n / 10]
      } else {
        return tens[n / 10] + print(n % 10)
      }
    } else if (n >= 10) {
      return teens[n - 10]
    } else if (n >= 1) {
      return ones[n]
    } else {
      throw IndexErr()
    }
  }
}

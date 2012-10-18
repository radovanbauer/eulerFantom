class Problem19 {
  Void main() {
    sundays := 0
    for (date := Date(1901, Month.jan, 1);
         date <= Date(2000, Month.dec, 31);
         date = date.plus(1day)) {
      if (date.day == 1 && date.weekday == Weekday.sun) {
        sundays++
      }
    }
    echo(sundays)
  }
}

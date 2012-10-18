class Problem19v2 {
  Void main() {
    year := 1901
    month := 1
    weekday := 2 // (Sun..Sat=0..6)
    sundays := 0
    while (year < 2001) {
      if (weekday == 0) {
        sundays++
      }
      weekday = (weekday + daysOfMonth(year, month)) % 7
      month++
      if (month == 13) {
        month = 1
        year++
      }
    }
    echo(sundays)
  }

  Int daysOfMonth(Int year, Int month) {
    switch(month) {
      case 1: return 31
      case 2: return isLeap(year) ? 29 : 28
      case 3: return 31
      case 4: return 30
      case 5: return 31
      case 6: return 30
      case 7: return 31
      case 8: return 31
      case 9: return 30
      case 10: return 31
      case 11: return 30
      case 12: return 31
      default: throw ArgErr()
    }
  }

  Bool isLeap(Int year) {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
  }
}

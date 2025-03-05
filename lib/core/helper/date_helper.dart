class DateHelper {
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  static List<DateTime> getDatesBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> dates = [];
    DateTime date = startDate;
    while (date.isBefore(endDate)) {
      dates.add(date);
      date = date.add(const Duration(days: 1));
    }
    return dates;
  }
}

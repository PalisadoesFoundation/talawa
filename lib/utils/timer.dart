class Timer {
  //takes a created date and returns time passed since then as a string
  String hoursOrDays(String createdAt) {
    String time = 'seconds';
    final DateTime now = DateTime.now();
    final Duration since = now
        .difference(DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt)));
    int intTime = since.inSeconds;
    if (since.inSeconds > 60) {
      time = 'minutes';
      intTime = since.inMinutes;
    }
    if (since.inSeconds > 3600) {
      time = 'hours';
      intTime = since.inHours;
    }
    if (since.inSeconds > 86400) {
      time = 'days';
      intTime = since.inDays;
    }
    if (since.inSeconds > 604800) {
      time = 'weeks';
      intTime = (since.inSeconds / 604800).round();
    }
    if (since.inSeconds > 2.628e+6) {
      time = 'months';
      intTime = (since.inSeconds / 2.628e+6).round();
    }
    if (since.inSeconds > 3.154e+7) {
      time = 'years';
      intTime = (since.inSeconds / 3.154e+7).round();
    }
    return '$intTime $time ago';
  }

  isToday(DateTime date) {
    final DateTime now = DateTime.now();
    if (DateTime(date.year, date.month, date.day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays ==
        0) {
      return true;
    } else {
      return false;
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    if (DateTime(date1.year, date1.month, date1.day)
            .difference(DateTime(date2.year, date2.month, date2.day))
            .inDays ==
        0) {
      return true;
    } else {
      return false;
    }
  }

  bool liesBetween(DateTime currentDate, DateTime date1, DateTime date2) {
    if (DateTime(date1.year, date1.month, date1.day)
            .difference(DateTime(date2.year, date2.month, date2.day))
            .inDays !=
        0) {
      if (currentDate.isAfter(date1) && currentDate.isBefore(date2)) {
        return true;
      }
    }
    return false;
  }

  bool isSameWeekDay(DateTime date1, DateTime date2) {
    return date1.day % 7 == date2.day % 7;
  }
}

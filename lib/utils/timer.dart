class Timer {
  String hoursOrDays(String createdAt) {
    String time = 'seconds';
    DateTime now = DateTime.now();
    Duration since = now
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
    return intTime.toString() + ' ' + time.toString() + ' ago';
  }
}

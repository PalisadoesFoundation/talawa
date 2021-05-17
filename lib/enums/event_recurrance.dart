enum Recurrance { daily, weekly, monthly, yearly }

final recurranceValues = EnumValues({
  "DAILY": Recurrance.daily,
  "WEEKLY": Recurrance.weekly,
  "MONTHLY": Recurrance.monthly,
  "YEARLY": Recurrance.yearly
});

class EnumValues<T> {
  EnumValues(this.map);

  Map<String, T> map;
  Map<T, String> reverseMap;

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

/// A framework-agnostic representation of a time (hour and minute).
///
/// Used in ViewModels instead of `flutter/material.dart`'s `TimeOfDay`
/// to avoid coupling the logic layer to the Flutter UI framework.
///
/// The View layer is responsible for converting this to `TimeOfDay` when
/// needed by Flutter widgets (e.g. `TimeOfDay(hour: tv.hour, minute: tv.minute)`).
class TimeValue {
  /// Creates a [TimeValue] with the given [hour] and [minute].
  const TimeValue({required this.hour, required this.minute});

  /// Hour in 24-hour format (0–23).
  final int hour;

  /// Minute (0–59).
  final int minute;

  /// Returns a [TimeValue] representing the current local time.
  factory TimeValue.now() {
    final now = DateTime.now();
    return TimeValue(hour: now.hour, minute: now.minute);
  }

  /// Returns a copy of this [TimeValue] with the given fields replaced.
  ///
  /// **params**:
  /// * `hour`: Optional new hour value.
  /// * `minute`: Optional new minute value.
  ///
  /// **returns**:
  /// * `TimeValue`: A new [TimeValue] with replaced fields.
  TimeValue replacing({int? hour, int? minute}) {
    return TimeValue(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  /// Formats the time as a string in HH:MM format (24-hour).
  ///
  /// The View can use this for display when a `BuildContext` is not available.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Time in HH:MM format.
  String toDisplayString() {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  bool operator ==(Object other) =>
      other is TimeValue && other.hour == hour && other.minute == minute;

  @override
  int get hashCode => Object.hash(hour, minute);

  @override
  String toString() => 'TimeValue(hour: $hour, minute: $minute)';
}

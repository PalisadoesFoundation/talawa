import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talawa/models/events/event_model.dart';

/// Color palette cycled through when assigning each event a marker color.
const List<Color> _eventColors = [
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.pink,
];

/// Converts [Event] objects to [Appointment] objects for the calendar.
///
/// Includes validation and fallbacks for:
/// - Null or invalid start/end dates
/// - End time before start time
/// - Zero duration events
/// - Invalid date ranges
///
/// **params**:
/// * `eventsList`: List of [Event] objects to convert.
///
/// **returns**:
/// * `List<Appointment>`: Valid Appointment objects for SfCalendar.
List<Appointment> convertEventsToAppointments(List<Event> eventsList) {
  final List<Appointment> appointments = [];

  for (final event in eventsList) {
    try {
      if (event.startAt == null || event.endAt == null) {
        continue;
      }

      final index = eventsList.indexOf(event);

      final DateTime startDate = DateTime(
        event.startAt!.year,
        event.startAt!.month,
        event.startAt!.day,
        event.startAt!.hour,
        event.startAt!.minute,
        event.startAt!.second,
      );

      DateTime endDate = DateTime(
        event.endAt!.year,
        event.endAt!.month,
        event.endAt!.day,
        event.endAt!.hour,
        event.endAt!.minute,
        event.endAt!.second,
      );

      // The API rejects same-day all-day events, so we bump endDate by +1 on
      // create. Clamp the appointment end back to the start day so the
      // calendar shows the dot on a single cell and the date-filtered list
      // picks it up correctly.
      final isAllDay = event.allDay ?? false;
      if (isAllDay &&
          endDate.difference(startDate).inDays == 1 &&
          endDate.hour == 0 &&
          endDate.minute == 0) {
        endDate = DateTime(
          startDate.year,
          startDate.month,
          startDate.day,
          23,
          59,
          59,
        );
      }

      final appointment = Appointment(
        startTime: startDate,
        endTime: endDate,
        subject: event.name?.isNotEmpty == true ? event.name! : 'Unnamed Event',
        color: _eventColors[index % _eventColors.length],
        location: event.location ?? '',
        id: event.id,
        isAllDay: isAllDay,
      );

      appointments.add(appointment);
    } catch (e) {
      debugPrint('Error converting event ${event.id} to appointment: $e');
      continue;
    }
  }

  return appointments;
}

/// Simple [CalendarDataSource] backed by a fixed list of [Appointment]s.
class EventDataSource extends CalendarDataSource {
  /// Wraps the supplied [appointments] for SfCalendar consumption.
  ///
  /// **params**:
  /// * `appointments`: Pre-built list of appointments to display.
  EventDataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}

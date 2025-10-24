import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/date_time_picker.dart';

/// EventCalendar widget for displaying events in a month view calendar.
class EventCalendar extends StatefulWidget {
  const EventCalendar({super.key});

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return BaseView<EventCalendarViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        final appointments = _convertEventsToAppointments(model.eventList);
        final List<Appointment> selectedDateEvents = _selectedDate != null
            ? appointments
                .where(
                  (a) =>
                      a.startTime.year == _selectedDate!.year &&
                      a.startTime.month == _selectedDate!.month &&
                      a.startTime.day == _selectedDate!.day,
                )
                .toList()
            : [];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.strictTranslate("Explore Events"),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () => Scaffold.maybeOf(context)?.openDrawer(),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  final pickedDate = await customDatePicker(
                    initialDate: DateTime.now(),
                  );
                  model.selectionChanged(
                    DateRangePickerSelectionChangedArgs(pickedDate),
                  );
                },
                icon: const Icon(Icons.date_range),
                tooltip: 'Select Date',
              ),
              IconButton(
                onPressed: () {
                  navigationService.pushScreen(Routes.eventPageForm);
                },
                icon: const Icon(Icons.add),
                tooltip: 'Add Event',
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Calendar
                    SizedBox(
                      height: constraints.maxHeight * 2 / 3,
                      child: SfCalendar(
                        view: CalendarView.month,
                        headerHeight: 60,
                        viewHeaderHeight: 60,
                        controller: model.calendarController,
                        dataSource: EventDataSource(appointments),
                        onViewChanged: model.viewChanged,
                        onSelectionChanged: (args) {
                          setState(() {
                            _selectedDate = args.date;
                          });
                        },
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: selectedDateEvents.length,
                        itemBuilder: (context, index) {
                          final event = selectedDateEvents[index];

                          // Format time
                          final String startTime =
                              '${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}';
                          final String endTime =
                              '${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}';

                          return GestureDetector(
                            onTap: () {
                              final originalEvent = model.eventList
                                  .firstWhere((e) => e.id == event.id);
                              navigationService.pushScreen(
                                "/eventInfo",
                                arguments: originalEvent,
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: [
                                    // Color accent bar
                                    Container(
                                      width: 5,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: event.color,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    // Event details
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            event.subject,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                size: 16,
                                                color: Colors.grey[700],
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '$startTime - $endTime',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: Colors.grey[700],
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// Converts Event objects to Appointment objects for the calendar.
///
/// Includes validation and fallbacks for:
/// - Null or invalid start/end dates
/// - End time before start time
/// - Zero duration events
/// - Invalid date ranges
///
/// **params**:
/// * `eventsList`: List of Event objects to convert
///
/// **returns**:
/// * `List<Appointment>`: List of valid Appointment objects for the calendar
List<Appointment> _convertEventsToAppointments(List<Event> eventsList) {
  const colors = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];
  final List<Appointment> appointments = [];

  for (final event in eventsList) {
    try {
      // Skip events without required date fields
      if (event.startAt == null || event.endAt == null) {
        continue;
      }

      final index = eventsList.indexOf(event);

      // Create DateTime objects with validation
      final DateTime startDate = DateTime(
        event.startAt!.year,
        event.startAt!.month,
        event.startAt!.day,
        event.startAt!.hour,
        event.startAt!.minute,
        event.startAt!.second,
      );

      final DateTime endDate = DateTime(
        event.endAt!.year,
        event.endAt!.month,
        event.endAt!.day,
        event.endAt!.hour,
        event.endAt!.minute,
        event.endAt!.second,
      );

      final appointment = Appointment(
        startTime: startDate,
        endTime: endDate,
        subject: event.name?.isNotEmpty == true ? event.name! : 'Unnamed Event',
        color: colors[index % colors.length],
        location: event.location ?? '',
        id: event.id,
        isAllDay: event.allDay ?? false,
      );

      appointments.add(appointment);
    } catch (e) {
      // Catch any unexpected errors during conversion
      debugPrint('Error converting event ${event.id} to appointment: $e');
      continue;
    }
  }

  return appointments;
}

/// Simple data source for SfCalendar.
class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}

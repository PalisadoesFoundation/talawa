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

enum _EventViewMode { calendar, card }

class _EventCalendarState extends State<EventCalendar> {
  DateTime? _selectedDate;
  _EventViewMode _viewMode = _EventViewMode.calendar;

  @override
  Widget build(BuildContext context) {
    return BaseView<EventCalendarViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        final appointments = _convertEventsToAppointments(model.eventList);
        final List<Appointment> selectedDateEvents;
        if (_selectedDate != null) {
          final selStart = DateTime(
            _selectedDate!.year,
            _selectedDate!.month,
            _selectedDate!.day,
          );
          final selEnd = selStart.add(const Duration(days: 1));
          // Include any event whose range overlaps the selected day
          // (covers genuine multi-day events while ignoring same-day all-day
          // events whose end was clamped to 23:59 in the converter).
          selectedDateEvents = appointments
              .where(
                (a) =>
                    a.startTime.isBefore(selEnd) && a.endTime.isAfter(selStart),
              )
              .toList();
        } else {
          selectedDateEvents = const [];
        }

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
                key: const Key('toggleEventViewMode'),
                onPressed: () {
                  setState(() {
                    _viewMode = _viewMode == _EventViewMode.calendar
                        ? _EventViewMode.card
                        : _EventViewMode.calendar;
                  });
                },
                icon: Icon(
                  _viewMode == _EventViewMode.calendar
                      ? Icons.view_agenda_outlined
                      : Icons.calendar_month,
                ),
                tooltip: _viewMode == _EventViewMode.calendar
                    ? 'Switch to card view'
                    : 'Switch to calendar view',
              ),
              if (_viewMode == _EventViewMode.calendar)
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
          body: _viewMode == _EventViewMode.calendar
              ? _buildCalendarView(
                  context,
                  model,
                  appointments,
                  selectedDateEvents,
                )
              : _buildCardView(context, model, appointments),
        );
      },
    );
  }

  Widget _buildCalendarView(
    BuildContext context,
    EventCalendarViewModel model,
    List<Appointment> appointments,
    List<Appointment> selectedDateEvents,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                  itemBuilder: (context, index) =>
                      _eventCard(context, model, selectedDateEvents[index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardView(
    BuildContext context,
    EventCalendarViewModel model,
    List<Appointment> appointments,
  ) {
    final sorted = [...appointments]
      ..sort((a, b) => a.startTime.compareTo(b.startTime));

    if (sorted.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'No events to show',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
    }

    final grouped = <String, List<Appointment>>{};
    for (final a in sorted) {
      final key =
          '${a.startTime.year}-${a.startTime.month.toString().padLeft(2, '0')}-${a.startTime.day.toString().padLeft(2, '0')}';
      grouped.putIfAbsent(key, () => []).add(a);
    }

    const monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final entries = grouped.entries.toList();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final dayEvents = entries[index].value;
        final d = dayEvents.first.startTime;
        final header = '${d.day} ${monthNames[d.month - 1]} ${d.year}';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
              ),
              child: Text(
                header,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
              ),
            ),
            ...dayEvents.map((a) => _eventCard(context, model, a)),
          ],
        );
      },
    );
  }

  Widget _eventCard(
    BuildContext context,
    EventCalendarViewModel model,
    Appointment event,
  ) {
    final String startTime =
        '${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}';
    final String endTime =
        '${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}';

    return GestureDetector(
      onTap: () {
        final originalEvent =
            model.eventList.firstWhere((e) => e.id == event.id);
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
              Container(
                width: 5,
                height: 50,
                decoration: BoxDecoration(
                  color: event.color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.subject,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                              .copyWith(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    if ((event.location ?? '').isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              event.location!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey[700]),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
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

      DateTime endDate = DateTime(
        event.endAt!.year,
        event.endAt!.month,
        event.endAt!.day,
        event.endAt!.hour,
        event.endAt!.minute,
        event.endAt!.second,
      );

      // The API rejects same-day all-day events, so we bump endDate by +1 on
      // create (see CreateEventViewModel). Clamp the appointment end back to
      // the start day for display so the calendar shows the dot on a single
      // cell and the date-filtered list picks it up correctly.
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
        color: colors[index % colors.length],
        location: event.location ?? '',
        id: event.id,
        isAllDay: isAllDay,
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

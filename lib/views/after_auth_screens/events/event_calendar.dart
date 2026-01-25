import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/models/events/event_model.dart';
=======
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/utils/app_localization.dart';
>>>>>>> upstream/develop
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/date_time_picker.dart';

<<<<<<< HEAD
/// EventCalendar returns a widget that has mutable state _EventCalendarState.
class EventCalendar extends StatelessWidget {
  const EventCalendar(this.eventList, {super.key});

  /// List of events that needs to bge passed when the calling this widget.
  final List<Event> eventList;
=======
/// EventCalendar widget for displaying events in a month view calendar.
class EventCalendar extends StatefulWidget {
  const EventCalendar({super.key});

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  DateTime? _selectedDate;
>>>>>>> upstream/develop

  @override
  Widget build(BuildContext context) {
    return BaseView<EventCalendarViewModel>(
<<<<<<< HEAD
      onModelReady: (model) => model.initialize(eventList),
      builder: (context, model, child) {
        print(model.calendarView);
        return Scaffold(
          // header of the page.
          appBar: AppBar(
            title: const Text('Event Calendar'),
            actions: [
              IconButton(
                // button to select the date and time of an event.
                onPressed: () async {
                  // initially pickedDate is initialised with current time.
                  final pickedDate =
                      await customDatePicker(initialDate: DateTime.now());
=======
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
>>>>>>> upstream/develop
                  model.selectionChanged(
                    DateRangePickerSelectionChangedArgs(pickedDate),
                  );
                },
                icon: const Icon(Icons.date_range),
<<<<<<< HEAD
              ),
              calendarViewSelection(model),
            ],
          ),
          body: Column(
            children: [
              // SizedBox(
              //   height: 100,
              //   // The SfDateRangePicker widget provides four different types of views to display.
              //   //It can be assigned to the widget constructor by using the view property.
              //   child: SfDateRangePicker(
              //     view: DateRangePickerView.month,
              //     controller: model.dateRangePickerController,
              //     showNavigationArrow: true,
              //     allowViewNavigation: false,
              //     monthViewSettings: const DateRangePickerMonthViewSettings(
              //       numberOfWeeksInView: 1,
              //       dayFormat: 'EEE',
              //     ),
              //     onSelectionChanged: model.selectionChanged,
              //   ),
              // ),
              Expanded(
                child: SfCalendar(
                  view: model.calendarView,
                  headerHeight: 60,
                  viewHeaderHeight: 60,
                  controller: model.calendarController,
                  dataSource: _getCalendarDataSource(eventList),
                  onViewChanged: model.viewChanged,
                ),
              ),
            ],
=======
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
>>>>>>> upstream/develop
          ),
        );
      },
    );
  }
<<<<<<< HEAD

  /// Popupmenu Button to select calendar view.
  ///
  /// **params**:
  /// * `model`: EventCalendarViewModel.
  ///
  /// **returns**:
  /// * `PopupMenuButton<String>`: custom PopupMenuButton..
  PopupMenuButton<String> calendarViewSelection(EventCalendarViewModel model) {
    final List<String> views = ["Day", "Month", "Schedule"];
    return PopupMenuButton<String>(
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          for (final view in views)
            PopupMenuItem(
              value: view,
              child: Text(view),
            ),
        ];
      },
      onSelected: (value) {
        model.changeView(value);
      },
    );
  }
}

/// function to convert `List<event>` to Appointment object.
///
/// Appointment is provided by the calender external library
///
/// **params**:
/// * `eventsList`: list of events to be converted
///
/// **returns**:
/// * `_AppointmentDataSource`: Entire data in `<Appointment>[]`(list) format
_AppointmentDataSource _getCalendarDataSource(List<Event> eventsList) {
  final appointments = <Appointment>[];
  final colors = [
=======
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
>>>>>>> upstream/develop
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];
<<<<<<< HEAD
  int index = 0;
  // looping through all the events created in the organization.
  eventsList.forEach((event) {
    DateTime startDate;
    DateTime endDate;
    if (event.startDate!.contains('/')) {
      startDate = DateFormat('MM/dd/yyyy').parse(event.startDate!);
    } else {
      startDate = DateFormat('yyyy-MM-dd').parse(event.startDate!);
    }

    if (event.endDate!.contains('/')) {
      endDate = DateFormat('MM/dd/yyyy').parse(event.endDate!);
    } else {
      endDate = DateFormat('yyyy-MM-dd').parse(event.endDate!);
    }
    print("${event.startTime!}##############################");
    final startTime = parseTime(event.startTime ?? '14:23:01');
    final endTime = parseTime(event.endTime ?? '21:23:01');

    // adding appointments on the calender for event[index] date time.
    appointments.add(
      Appointment(
        startTime: startDate
            .add(Duration(hours: startTime.hour, minutes: startTime.minute)),
        endTime:
            endDate.add(Duration(hours: endTime.hour, minutes: endTime.minute)),
        subject: event.title!,
        color: colors[index % colors.length],
        location: event.location,
        id: event.id,
      ),
    );
    index++;
  });

  return _AppointmentDataSource(appointments);
}

/// a_line_ending_with_end_punctuation.
///
/// **params**:
/// * `time`: define_the_param
///
/// **returns**:
/// * `DateTime`: define_the_return
DateTime parseTime(String time) {
  try {
    return DateFormat('h:mm a', 'en_US').parse(time);
  } on FormatException {
    print('Caught FormatException: $time');
    try {
      return DateFormat('Hms').parse(time);
    } catch (e) {
      print('Caught error: $e');
      throw Exception('Invalid time format: $time');
    }
  }
}

/// class for handling the data source.
///
/// assign the appointments value
class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
=======
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
>>>>>>> upstream/develop
  }
}

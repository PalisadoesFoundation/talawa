import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/date_time_picker.dart';

/// EventCalendar returns a widget that has mutable state _EventCalendarState.
class EventCalendar extends StatelessWidget {
  const EventCalendar(this.eventList, {super.key});

  /// List of events that needs to bge passed when the calling this widget.
  final List<Event> eventList;

  @override
  Widget build(BuildContext context) {
    return BaseView<EventCalendarViewModel>(
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
                  model.selectionChanged(
                    DateRangePickerSelectionChangedArgs(pickedDate),
                  );
                },
                icon: const Icon(Icons.date_range),
              ),
              calendarViewSelection(model),
            ],
          ),
          body: Column(
            children: [
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
          ),
        );
      },
    );
  }

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
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];
  int index = 0;
  // looping through all the events created in the organization.
  eventsList.forEach((event) {
    DateTime startDate;
    DateTime endDate;
    try {
      startDate = DateFormat('yyyy-MM-dd').parse(event.startDate!);

      endDate = DateFormat('yyyy-MM-dd').parse(event.endDate!);
    } catch (e) {
      throw Exception(
        'Invalid date format: ${event.startDate} or ${event.endDate}',
      );
    }

    final startTime = parseTime(event.startTime);
    final endTime = parseTime(event.endTime);

    // adding appointments on the calender for event[index] date time.
    appointments.add(
      Appointment(
        startTime: startDate
            .add(Duration(hours: startTime.hour, minutes: startTime.minute)),
        endTime:
            endDate.add(Duration(hours: endTime.hour, minutes: endTime.minute)),
        subject: event.name ?? 'No Name',
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
    try {
      return DateFormat('Hms').parse(time);
    } catch (e) {
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
  }
}

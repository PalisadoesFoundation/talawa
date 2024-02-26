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

/// function to convert List<event> to Appointment object.
///
/// Appointment is provided by the calender external library
///
/// **params**:
/// * `eventsList`: list of events to be converted
///
/// **returns**:
/// * `_AppointmentDataSource`: Entire data in <Appointment>[](list) format
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
    final startDate = DateFormat('yMd').parse(event.startDate!);
    print("${event.startTime!}##############################");
    final startTime = parseTime(event.startTime ?? '14:23:01');
    // .parse(event.startTime!);
    final endDate = DateFormat('yMd').parse(event.endDate!);
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
  }
}

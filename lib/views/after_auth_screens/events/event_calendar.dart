import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/widgets/date_time_picker.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar(this.eventList, {Key? key}) : super(key: key);
  final List<Event> eventList;

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  final CalendarController _calendarController = CalendarController();
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _dateRangePickerController.selectedDate =
          viewChangedDetails.visibleDates[0];
      _dateRangePickerController.displayDate =
          viewChangedDetails.visibleDates[0];
    });
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _calendarController.displayDate = args.value as DateTime?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Calendar'),
        actions: [
          IconButton(
            onPressed: () async {
              final pickedDate =
                  await customDatePicker(initialDate: DateTime.now());
              selectionChanged(DateRangePickerSelectionChangedArgs(pickedDate));
            },
            icon: const Icon(Icons.date_range),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: SfDateRangePicker(
              controller: _dateRangePickerController,
              showNavigationArrow: true,
              allowViewNavigation: false,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                numberOfWeeksInView: 1,
                dayFormat: 'EEE',
              ),
              onSelectionChanged: selectionChanged,
            ),
          ),
          Expanded(
            child: SfCalendar(
              headerHeight: 0,
              viewHeaderHeight: 0,
              controller: _calendarController,
              dataSource: _getCalendarDataSource(widget.eventList),
              onViewChanged: viewChanged,
            ),
          ),
        ],
      ),
    );
  }
}

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
  eventsList.forEach((event) {
    final startDate = DateFormat('yMd').parse(event.startDate!);
    final startTime = DateFormat.jm().parse(event.startTime!);
    final endDate = DateFormat('yMd').parse(event.endDate!);
    final endTime = DateFormat.jm().parse(event.endTime!);

    appointments.add(Appointment(
      startTime: startDate
          .add(Duration(hours: startTime.hour, minutes: startTime.minute)),
      endTime:
          endDate.add(Duration(hours: endTime.hour, minutes: endTime.minute)),
      subject: event.title!,
      color: colors[index % colors.length],
      location: event.location,
      id: event.id,
    ));
    index++;
  });

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

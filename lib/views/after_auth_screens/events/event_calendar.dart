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
  @override
  Widget build(BuildContext context) {
    return BaseView<EventCalendarViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
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
          body: SfCalendar(
            view: CalendarView.month,
            headerHeight: 60,
            viewHeaderHeight: 60,
            controller: model.calendarController,
            dataSource:
                EventDataSource(_convertEventsToAppointments(model.eventList)),
            onViewChanged: model.viewChanged,
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
              agendaViewHeight: 200,
              agendaItemHeight: 50,
              monthCellStyle: MonthCellStyle(
                textStyle: TextStyle(fontSize: 14),
                trailingDatesTextStyle: TextStyle(color: Colors.grey),
                leadingDatesTextStyle: TextStyle(color: Colors.grey),
              ),
            ),
            onTap: (details) {
              if (details.targetElement == CalendarElement.appointment &&
                  details.appointments != null &&
                  details.appointments!.isNotEmpty) {
                final appointment = details.appointments?.first as Appointment;
                final originalEventId = appointment.id;
                final event =
                    model.eventList.firstWhere((e) => e.id == originalEventId);
                navigationService.pushScreen("/eventInfo", arguments: event);
              }
            },
          ),
        );
      },
    );
  }
}

/// Converts Event objects to Appointment objects for the calendar.
///
/// **params**:
/// * `eventsList`: List of Event objects to convert
///
/// **returns**:
/// * `List<Appointment>`: List of Appointment objects for the calendar
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
    if (event.startAt == null || event.endAt == null) continue;
    final index = eventsList.indexOf(event);

    final startDate = DateTime(
      event.startAt!.year,
      event.startAt!.month,
      event.startAt!.day,
      event.startAt!.hour,
      event.startAt!.minute,
      event.startAt!.second,
    );

    final endDate = DateTime(
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
      subject: event.name ?? 'No Name',
      color: colors[index % colors.length],
      location: event.location,
      id: event.id,
      isAllDay: event.allDay ?? false,
    );
    appointments.add(appointment);
  }

  return appointments;
}

/// Simple data source for SfCalendar.
class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}

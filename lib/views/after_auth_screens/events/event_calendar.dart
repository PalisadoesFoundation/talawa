import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar_helpers.dart';
import 'package:talawa/views/after_auth_screens/events/event_card_widget.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/date_time_picker.dart';

/// Display modes for the Explore Events screen.
///
/// `calendar` shows the month grid with a date-filtered list; `card` shows
/// every loaded event grouped by day in a scrollable list.
enum _EventViewMode {
  /// Month grid with selected-day events listed below.
  calendar,

  /// Flat chronological list of all loaded events grouped by day.
  card,
}

/// EventCalendar widget for displaying events in a month view calendar.
class EventCalendar extends StatefulWidget {
  /// Standard const constructor for the screen.
  const EventCalendar({super.key});

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  DateTime? _selectedDate;
  _EventViewMode _viewMode = _EventViewMode.calendar;

  @override
  Widget build(BuildContext context) {
    return BaseView<EventCalendarViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        final appointments = convertEventsToAppointments(model.eventList);
        final selectedDateEvents = _selectedDateAppointments(appointments);

        return Scaffold(
          appBar: _buildAppBar(context, model),
          body: _viewMode == _EventViewMode.calendar
              ? _buildCalendarView(model, appointments, selectedDateEvents)
              : _buildCardView(context, model, appointments),
        );
      },
    );
  }

  /// Filters [appointments] to those overlapping the currently selected day.
  ///
  /// Returns an empty list when no day is selected. Range overlap covers
  /// genuine multi-day events while ignoring same-day all-day events whose
  /// end has been clamped to 23:59 in [convertEventsToAppointments].
  ///
  /// **params**:
  /// * `appointments`: All loaded appointments.
  ///
  /// **returns**:
  /// * `List<Appointment>`: Subset overlapping [_selectedDate].
  List<Appointment> _selectedDateAppointments(List<Appointment> appointments) {
    if (_selectedDate == null) return const [];
    final selStart = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
    );
    final selEnd = selStart.add(const Duration(days: 1));
    return appointments
        .where(
          (a) => a.startTime.isBefore(selEnd) && a.endTime.isAfter(selStart),
        )
        .toList();
  }

  /// Builds the screen's [AppBar] including the view-mode toggle.
  ///
  /// **params**:
  /// * `context`: Build context for theming and translations.
  /// * `model`: Active [EventCalendarViewModel] for navigation callbacks.
  ///
  /// **returns**:
  /// * `AppBar`: Configured app bar widget.
  AppBar _buildAppBar(BuildContext context, EventCalendarViewModel model) {
    return AppBar(
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
        icon: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
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
              final pickedDate =
                  await customDatePicker(initialDate: DateTime.now());
              model.selectionChanged(
                DateRangePickerSelectionChangedArgs(pickedDate),
              );
            },
            icon: const Icon(Icons.date_range),
            tooltip: 'Select Date',
          ),
        IconButton(
          onPressed: () => navigationService.pushScreen(Routes.eventPageForm),
          icon: const Icon(Icons.add),
          tooltip: 'Add Event',
        ),
      ],
    );
  }

  /// Builds the month-calendar body for the Explore Events screen.
  ///
  /// Used when [_viewMode] is `calendar`; shows a month grid plus a list of
  /// events for the currently selected day.
  ///
  /// **params**:
  /// * `model`: Active [EventCalendarViewModel].
  /// * `appointments`: All loaded events as SfCalendar appointments.
  /// * `selectedDateEvents`: Subset of [appointments] overlapping the
  ///   currently selected day.
  ///
  /// **returns**:
  /// * `Widget`: The calendar-mode body.
  Widget _buildCalendarView(
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
                  itemBuilder: (context, index) => EventCardWidget(
                    model: model,
                    event: selectedDateEvents[index],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Builds the chronological card list of events.
  ///
  /// Used when [_viewMode] is `card`; renders every loaded event grouped by
  /// day in a scrollable list.
  ///
  /// **params**:
  /// * `context`: Build context for theming.
  /// * `model`: Active [EventCalendarViewModel].
  /// * `appointments`: All loaded events as SfCalendar appointments.
  ///
  /// **returns**:
  /// * `Widget`: The card-mode body.
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Text(
                header,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
              ),
            ),
            ...dayEvents.map((a) => EventCardWidget(model: model, event: a)),
          ],
        );
      },
    );
  }
}

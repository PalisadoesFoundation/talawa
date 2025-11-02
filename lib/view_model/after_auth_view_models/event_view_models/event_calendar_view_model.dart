import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// ViewModel for managing events and calendar view.
///
/// This ViewModel handles operations related to events and calendar views.
class EventCalendarViewModel extends BaseModel {
  /// Instance of EventService to manage event-related operations.
  final eventService = locator<EventService>();

  /// Instance of UserConfig to track organization changes.
  final _userConfig = locator<UserConfig>();

  /// Controller for managing the calendar.
  final CalendarController _calendarController = CalendarController();

  /// Subscription for tracking changes in the current organization.
  StreamSubscription? _currentOrganizationStreamSubscription;

  /// Subscription for tracking changes in events.
  StreamSubscription? _eventStreamSubscription;

  /// Controller for managing the date range picker.
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  /// The current view of the calendar.
  late CalendarView _calendarView;

  /// List of events.
  List<Event> _eventList = [];

  /// Getter for accessing the events list.
  List<Event> get eventList => _eventList;

  /// Getter for accessing the calendar controller.
  CalendarController get calendarController => _calendarController;

  /// Getter for accessing the date range picker controller.
  DateRangePickerController get dateRangePickerController =>
      _dateRangePickerController;

  /// Getter for accessing the current view of the calendar.
  CalendarView get calendarView => _calendarView;

  /// Initializes the view model.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    _calendarView = CalendarView.month;

    // Subscribe to organization changes
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrgInfoStream.listen((newOrg) {
      _resetToCurrentMonth();
    });

    // Subscribe to event stream
    _eventStreamSubscription = eventService.eventStream.listen((events) {
      _eventList = events;
      notifyListeners();
    });

    // Fetch events for the current month
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    getEventsForCalendar(startOfMonth, endOfMonth);
    notifyListeners();
  }

  /// Resets the calendar to current month and fetches events for the new organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _resetToCurrentMonth() {
    final now = DateTime.now();
    _calendarController.displayDate = now;
    _dateRangePickerController.selectedDate = now;
    _dateRangePickerController.displayDate = now;
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
    getEventsForCalendar(startOfMonth, endOfMonth);
    notifyListeners();
  }

  /// Refreshes events for the currently displayed month.
  ///
  /// This method should be called after creating, updating, or deleting events
  /// to ensure the calendar view is updated with the latest events.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> refreshCurrentViewEvents() async {
    final DateTime currentDisplayDate =
        _calendarController.displayDate ?? DateTime.now();
    final DateTime startOfMonth =
        DateTime(currentDisplayDate.year, currentDisplayDate.month, 1);
    final DateTime endOfMonth = DateTime(
      currentDisplayDate.year,
      currentDisplayDate.month + 1,
      0,
      23,
      59,
      59,
    );

    await getEventsForCalendar(startOfMonth, endOfMonth);
  }

  /// The function to triggered when the view is changed.
  ///
  /// **params**:
  /// * `viewChangedDetails`: The dates that visible on the view changes in SfCalendar. type is ViewChangedDetails
  ///
  /// **returns**:
  ///   None
  void viewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _dateRangePickerController.selectedDate =
          viewChangedDetails.visibleDates[0];
      _dateRangePickerController.displayDate =
          viewChangedDetails.visibleDates[0];
      final DateTime currentDisplayDate =
          _calendarController.displayDate ?? DateTime.now();
      final DateTime startOfMonth =
          DateTime(currentDisplayDate.year, currentDisplayDate.month, 1);
      final DateTime endOfMonth = DateTime(
        currentDisplayDate.year,
        currentDisplayDate.month + 1,
        0,
        23,
        59,
        59,
      );
      getEventsForCalendar(startOfMonth, endOfMonth);
    });
  }

  /// Fetches events for the calendar within a specified date range.
  ///
  /// **params**:
  /// * `start`: DateTime representing the start date of the range.
  /// * `end`: DateTime representing the end date of the range.
  ///
  /// **returns**:
  ///   None
  Future<void> getEventsForCalendar(DateTime start, DateTime end) async {
    await eventService.fetchEventsWithDates(
      start,
      end,
      includeRecurring: true,
    );
    notifyListeners();
  }

  /// Disposes resources and cancels subscriptions.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  @override
  void dispose() {
    _currentOrganizationStreamSubscription?.cancel();
    _calendarController.dispose();
    _dateRangePickerController.dispose();
    _eventStreamSubscription?.cancel();
    super.dispose();
  }

  /// This method responds to changes in the selected date or date range in the SfDateRangePicker.
  ///
  /// **params**:
  /// * `args`: Object of type DateRangePickerSelectionChangedArgs, The selected dates or ranges changes in the SfDateRangePicker.
  ///
  /// **returns**:
  ///   None
  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      final pickedDate = args.value as DateTime?;
      if (pickedDate != null) {
        // Fetch events for the picked date's month only
        final startOfMonth = DateTime(pickedDate.year, pickedDate.month, 1);
        final endOfMonth =
            DateTime(pickedDate.year, pickedDate.month + 1, 0, 23, 59, 59);
        await getEventsForCalendar(startOfMonth, endOfMonth);
      }
      _calendarController.displayDate = pickedDate;
    });
  }
}

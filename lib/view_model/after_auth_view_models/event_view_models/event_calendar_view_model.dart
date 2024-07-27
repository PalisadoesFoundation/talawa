import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// ViewModel for managing events and calendar view.
///
/// This ViewModel handles operations related to events and calendar views.
class EventCalendarViewModel extends BaseModel {
  /// List of events managed by the ViewModel.
  late List<Event> _eventList = [];

  /// Controller for managing the calendar.
  final CalendarController _calendarController = CalendarController();

  /// Controller for managing the date range picker.
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  /// The current view of the calendar.
  late CalendarView _calendarView;

  /// Getter for accessing the calendar controller.
  CalendarController get calendarController => _calendarController;

  /// Getter for accessing the date range picker controller.
  DateRangePickerController get dateRangePickerController =>
      _dateRangePickerController;

  /// Getter for accessing the current view of the calendar.
  CalendarView get calendarView => _calendarView;

  /// Getter for accessing the current list of events.
  List<Event> get eventList => _eventList;

  /// Initializes the view model.
  ///
  /// **params**:
  /// * `eventList`: list of events.
  ///
  /// **returns**:
  ///   None
  void initialize(List<Event> eventList) {
    _eventList = eventList;
    _calendarView = CalendarView.schedule;
  }

  /// The function to triggered when the view is changed.
  ///
  /// **params**:
  /// * `viewChangedDetails`: The dates that visible on the view changes in SfCalendar. type is ViewChangedDetails
  ///
  /// **returns**:
  ///   None
  void viewChanged(ViewChangedDetails viewChangedDetails) {
    print("came");
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _dateRangePickerController.selectedDate =
          viewChangedDetails.visibleDates[0];
      _dateRangePickerController.displayDate =
          viewChangedDetails.visibleDates[0];
    });
  }

  /// Changes the view of the calendar.
  ///
  /// **params**:
  /// * `view`: String representing the desired view ("Day", "Month", "Schedule").
  ///
  /// **returns**:
  ///   None
  void changeView(String view) {
    switch (view) {
      case "Day":
        _calendarView = CalendarView.day;
        break;
      case "Month":
        _calendarView = CalendarView.month;
        break;
      case "Schedule":
        _calendarView = CalendarView.schedule;
        break;
      default:
        break;
    }
    calendarController.view = _calendarView;
    notifyListeners();
  }

  /// function to be triggered when selection is changed.
  ///
  ///
  /// **params**:
  /// * `args`: Object of type DateRangePickerSelectionChangedArgs, The selected dates or ranges changes in the SfDateRangePicker.
  ///
  /// **returns**:
  ///   None
  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _calendarController.displayDate = args.value as DateTime?;
    });
  }
}






EventCalendarViewModel class - event\_calendar\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_calendar\_view\_model.dart](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. EventCalendarViewModel class

EventCalendarViewModel


dark\_mode

light\_mode




# EventCalendarViewModel class


ViewModel for managing events and calendar view.

This ViewModel handles operations related to events and calendar views.


Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* EventCalendarViewModel



## Constructors

[EventCalendarViewModel](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/EventCalendarViewModel.html)()




## Properties

[calendarController](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/calendarController.html)
→ [CalendarController](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/CalendarController-class.html)

Getter for accessing the calendar controller.
no setter

[calendarView](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/calendarView.html)
→ [CalendarView](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/CalendarView.html)

Getter for accessing the current view of the calendar.
no setter

[dateRangePickerController](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/dateRangePickerController.html)
→ [DateRangePickerController](https://pub.dev/documentation/syncfusion_flutter_datepicker/27.2.5/datepicker/DateRangePickerController-class.html)

Getter for accessing the date range picker controller.
no setter

[eventList](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/eventList.html)
→ List<[Event](../models_events_event_model/Event-class.html)>

Getter for accessing the current list of events.
no setter

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[changeView](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/changeView.html)(String view)
→ void


Changes the view of the calendar.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[initialize](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/initialize.html)(List<[Event](../models_events_event_model/Event-class.html)> eventList)
→ void


Initializes the view model.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[selectionChanged](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/selectionChanged.html)([DateRangePickerSelectionChangedArgs](https://pub.dev/documentation/syncfusion_flutter_datepicker/27.2.5/datepicker/DateRangePickerSelectionChangedArgs-class.html) args)
→ void


function to be triggered when selection is changed.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[viewChanged](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/viewChanged.html)([ViewChangedDetails](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/ViewChangedDetails-class.html) viewChangedDetails)
→ void


The function to triggered when the view is changed.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_calendar\_view\_model](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. EventCalendarViewModel class

##### event\_calendar\_view\_model library





talawa
1.0.0+1







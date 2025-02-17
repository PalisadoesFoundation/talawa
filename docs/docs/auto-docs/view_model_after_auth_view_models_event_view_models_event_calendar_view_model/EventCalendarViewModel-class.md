
<div>

# EventCalendarViewModel class

</div>


ViewModel for managing events and calendar view.

This ViewModel handles operations related to events and calendar views.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   EventCalendarViewModel



## Constructors

[EventCalendarViewModel](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/EventCalendarViewModel.md)

:   



## Properties

[[calendarController](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/calendarController.md)] [→ [CalendarController](https://pub.dev/documentation/syncfusion_flutter_calendar/28.2.3/calendar/CalendarController-class.html)]
:   Getter for accessing the calendar controller.
    ::: features
    no setter
    :::

[[calendarView](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/calendarView.md)] [→ [CalendarView](https://pub.dev/documentation/syncfusion_flutter_calendar/28.2.3/calendar/CalendarView.html)]
:   Getter for accessing the current view of the calendar.
    ::: features
    no setter
    :::

[[dateRangePickerController](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/dateRangePickerController.md)] [→ [DateRangePickerController](https://pub.dev/documentation/syncfusion_flutter_datepicker/28.2.3/datepicker/DateRangePickerController-class.html)]
:   Getter for accessing the date range picker controller.
    ::: features
    no setter
    :::

[[eventList](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/eventList.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.md)]\>]]
:   Getter for accessing the current list of events.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[changeView](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/changeView.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] view]) → void ]
:   Changes the view of the calendar.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[initialize](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/initialize.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Event](../models_events_event_model/Event-class.md)]\>]] eventList]) → void ]
:   Initializes the view model.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[selectionChanged](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/selectionChanged.md)][([[[DateRangePickerSelectionChangedArgs](https://pub.dev/documentation/syncfusion_flutter_datepicker/28.2.3/datepicker/DateRangePickerSelectionChangedArgs-class.md)] args]) → void ]
:   function to be triggered when selection is changed.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[viewChanged](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/viewChanged.md)][([[[ViewChangedDetails](https://pub.dev/documentation/syncfusion_flutter_calendar/28.2.3/calendar/ViewChangedDetails-class.md)] viewChangedDetails]) → void ]
:   The function to triggered when the view is changed.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [event_calendar_view_model](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  EventCalendarViewModel class

##### event_calendar_view_model library








::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  EventCalendarViewModel class

::: self-name
EventCalendarViewModel
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class-sidebar.html"}
<div>

# [EventCalendarViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
ViewModel for managing events and calendar view.

This ViewModel handles operations related to events and calendar views.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EventCalendarViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EventCalendarViewModel](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/EventCalendarViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[calendarController](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/calendarController.html)]{.name} [→ [CalendarController](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/CalendarController-class.html)]{.signature}
:   Getter for accessing the calendar controller.
    ::: features
    [no setter]{.feature}
    :::

[[calendarView](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/calendarView.html)]{.name} [→ [CalendarView](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/CalendarView.html)]{.signature}
:   Getter for accessing the current view of the calendar.
    ::: features
    [no setter]{.feature}
    :::

[[dateRangePickerController](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/dateRangePickerController.html)]{.name} [→ [DateRangePickerController](https://pub.dev/documentation/syncfusion_flutter_datepicker/27.2.5/datepicker/DateRangePickerController-class.html)]{.signature}
:   Getter for accessing the date range picker controller.
    ::: features
    [no setter]{.feature}
    :::

[[eventList](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/eventList.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter for accessing the current list of events.
    ::: features
    [no setter]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[changeView](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/changeView.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [view]{.parameter-name}]{#changeView-param-view .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Changes the view of the calendar.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[initialize](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/initialize.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [eventList]{.parameter-name}]{#initialize-param-eventList .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Initializes the view model.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[selectionChanged](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/selectionChanged.html)]{.name}[([[[DateRangePickerSelectionChangedArgs](https://pub.dev/documentation/syncfusion_flutter_datepicker/27.2.5/datepicker/DateRangePickerSelectionChangedArgs-class.html)]{.type-annotation} [args]{.parameter-name}]{#selectionChanged-param-args .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   function to be triggered when selection is changed.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[viewChanged](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel/viewChanged.html)]{.name}[([[[ViewChangedDetails](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/ViewChangedDetails-class.html)]{.type-annotation} [viewChangedDetails]{.parameter-name}]{#viewChanged-param-viewChangedDetails .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   The function to triggered when the view is changed.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_calendar_view_model](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  EventCalendarViewModel class

##### event_calendar_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}

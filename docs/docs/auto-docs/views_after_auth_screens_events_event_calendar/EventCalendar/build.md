




build method - EventCalendar class - event\_calendar library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/event\_calendar.dart](../../views_after_auth_screens_events_event_calendar/views_after_auth_screens_events_event_calendar-library.html)
3. [EventCalendar](../../views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
build(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the tree
in a given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) and when the dependencies of this widget change
(e.g., an [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling [Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

* the fields of the widget, which themselves must not change over time,
  and
* any ambient state obtained from the `context` using
  [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget's [build](../../views_after_auth_screens_events_event_calendar/EventCalendar/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [event\_calendar](../../views_after_auth_screens_events_event_calendar/views_after_auth_screens_events_event_calendar-library.html)
3. [EventCalendar](../../views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4. build method

##### EventCalendar class





talawa
1.0.0+1







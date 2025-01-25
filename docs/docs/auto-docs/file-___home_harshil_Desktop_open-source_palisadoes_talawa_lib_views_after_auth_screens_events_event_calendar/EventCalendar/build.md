




build method - EventCalendar class - event\_calendar library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/event\_calendar.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/)
3. [EventCalendar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

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
2. [event\_calendar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/)
3. [EventCalendar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4. build method

##### EventCalendar class





talawa
1.0.0+1







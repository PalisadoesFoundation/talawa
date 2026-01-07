# Overview for `YearPicker`

## Description

A scrollable grid of years to allow picking a year.

 The year picker widget is rarely used directly. Instead, consider using
 [CalendarDatePicker], or [showDatePicker] which create full date pickers.

 See also:

  * [CalendarDatePicker], which provides a Material Design date picker
    interface.

  * [showDatePicker], which shows a dialog containing a Material Design
    date picker.

## Dependencies

- StatefulWidget

## Members

- **currentDate**: `DateTime`
  The current date.

 This date is subtly highlighted in the picker.

- **firstDate**: `DateTime`
  The earliest date the user is permitted to pick.

- **lastDate**: `DateTime`
  The latest date the user is permitted to pick.

- **selectedDate**: `DateTime?`
  The currently selected date.

 This date is highlighted in the picker.

- **onChanged**: `ValueChanged&lt;DateTime&gt;`
  Called when the user picks a year.

- **dragStartBehavior**: `DragStartBehavior`
  

- **calendarDelegate**: `CalendarDelegate&lt;DateTime&gt;`
  

## Constructors

### Unnamed Constructor
Creates a year picker.

 The [lastDate] must be after the [firstDate].


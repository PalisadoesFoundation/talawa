# Overview for `BaseEventViewModel`

## Description

Base class for event view models with common recurrence functionality.

## Dependencies

- BaseModel

## Members

- **multiMediaPickerService**: `MultiMediaPickerService`
  MultiMediaPickerService instance.

- **eventService**: `dynamic`
  Event service instance.

- **validate**: `AutovalidateMode`
  Form validation mode.

- **currentOrg**: `OrgInfo`
  Current organization info.

- **imageFile**: `File?`
  Image file for the event.

- **eventTitleTextController**: `TextEditingController`
  Event title controller.

- **eventLocationTextController**: `TextEditingController`
  Event location controller.

- **eventDescriptionTextController**: `TextEditingController`
  Event description controller.

- **repeatsEveryCountController**: `TextEditingController`
  Recurrence interval controller.

- **eventStartTime**: `TimeOfDay`
  Event start time.

- **eventEndTime**: `TimeOfDay`
  Event end time greater then start time in deafult also.

- **eventStartDate**: `DateTime`
  Event start date.

- **eventEndDate**: `DateTime`
  Event end date.

- **isPublicSwitch**: `bool`
  Whether the event is public.

- **isRegisterableSwitch**: `bool`
  Whether the event is registerable.

- **isAllDay**: `bool`
  Whether the event is all day.

- **isRecurring**: `bool`
  Whether the event is recurring.

- **frequency**: `String`
  Recurrence frequency.

- **weekDays**: `Set&lt;String&gt;`
  Recurrence weekdays.

- **interval**: `int`
  Recurrence interval.

- **count**: `int?`
  Recurrence occurrence count.

- **byMonthDay**: `List&lt;int&gt;?`
  Recurrence month days.

- **byMonth**: `List&lt;int&gt;?`
  Recurrence months.

- **weekDayOccurrenceInMonth**: `int?`
  Occurrence of weekday in month (for monthly/yearly). -1 for last occurrence.

- **byPosition**: `int?`
  Day position for monthly recurrence (e.g., 1st Monday, 3rd Friday).

- **recurrenceEndDate**: `DateTime?`
  Recurrence end date.

- **never**: `bool`
  Whether recurrence never ends.

- **recurrenceLabel**: `String`
  Recurrence display label.

- **eventEndType**: `String`
  Event end type.

- **useDayOfWeekMonthly**: `bool`
  Whether to use day of week for monthly recurrence (vs. day of month).

- **useDayOfWeekYearly**: `bool`
  Whether to use day of week for yearly recurrence (vs. day of month).

## Constructors

### Unnamed Constructor
Constructor to initialize controllers and focus nodes.


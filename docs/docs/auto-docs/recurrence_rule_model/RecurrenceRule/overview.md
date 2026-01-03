# Overview for `RecurrenceRule`

## Description

Recurrence rule model for events.

## Members

- **frequency**: `String`
  Converts the RecurrenceRule instance to a JSON map.

- **interval**: `int?`
  The interval for the recurrence rule.

- **endDate**: `DateTime?`
  The end date.

- **recurrenceEndDate**: `DateTime?`
  The recurrence end date for the recurrence rule.

- **count**: `int?`
  The count for the recurrence rule.

- **never**: `bool?`
  Indicates if the recurrence rule never ends.

- **byDay**: `List<String>?`
  The days of the week for the recurrence rule.

- **byMonth**: `List<int>?`
  The months for the recurrence rule.

- **byMonthDay**: `List<int>?`
  The month days for the recurrence rule.

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map<String, dynamic>`

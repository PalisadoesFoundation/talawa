# Method: `validateEventDateTime`

## Description

Validates that event end date/time is not before start date/time.

 **params**:
 * `startDate`: start date of the event
 * `startTime`: start time of the event
 * `endDate`: end date of the event
 * `endTime`: end time of the event

 **returns**:
 * `String?`: error message if invalid, null if valid

## Return Type
`String?`

## Parameters

- `startDate`: `DateTime`
- `startTime`: `TimeOfDay`
- `endDate`: `DateTime`
- `endTime`: `TimeOfDay`

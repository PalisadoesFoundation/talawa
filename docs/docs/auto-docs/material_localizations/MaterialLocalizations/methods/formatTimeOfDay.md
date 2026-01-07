# Method: `formatTimeOfDay`

## Description

Formats [timeOfDay] according to the value of [timeOfDayFormat].

 If [alwaysUse24HourFormat] is true, formats hour using [HourFormat.HH]
 rather than the default for the current locale. This value is usually
 passed from [MediaQueryData.alwaysUse24HourFormat], which has platform-
 specific behavior.

## Return Type
`String`

## Parameters

- `timeOfDay`: `TimeOfDay`
- ``: `dynamic`

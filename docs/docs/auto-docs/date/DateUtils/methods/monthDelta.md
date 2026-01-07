# Method: `monthDelta`

## Description


 Determines the number of months between two [DateTime] objects.

 For example:

 ```dart
 DateTime date1 = DateTime(2019, 6, 15);
 DateTime date2 = DateTime(2020, 1, 15);
 int delta = DateUtils.monthDelta(date1, date2);
 ```

 The value for `delta` would be `7`.
 

## Return Type
`int`

## Parameters

- `startDate`: `DateTime`
- `endDate`: `DateTime`

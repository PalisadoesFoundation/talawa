# Method: `addMonthsToMonthDate`

## Description


 Returns a [DateTime] that is [monthDate] with the added number
 of months and the day set to 1 and time set to midnight.

 For example:

 ```dart
 DateTime date = DateTime(2019, 1, 15);
 DateTime futureDate = DateUtils.addMonthsToMonthDate(date, 3);
 ```

 `date` would be January 15, 2019.
 `futureDate` would be April 1, 2019 since it adds 3 months.
 

## Return Type
`DateTime`

## Parameters

- `monthDate`: `DateTime`
- `monthsToAdd`: `int`

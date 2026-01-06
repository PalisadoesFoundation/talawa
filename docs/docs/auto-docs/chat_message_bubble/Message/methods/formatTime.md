# Method: `formatTime`

## Description

Formats the given DateTime into a human-readable time string for chat messages.

 Returns different formats based on the time difference:
 - For messages older than a day: "day/month" format
 - For messages within a day: "hour:minute" format
 - For messages within an hour: "Xm ago" format
 - For very recent messages: "now"

 **params**:
 * `dateTime`: The DateTime to format

 **returns**:
 * `String`: Formatted time string appropriate for chat messages

## Return Type
`String`

## Parameters

- `dateTime`: `DateTime`

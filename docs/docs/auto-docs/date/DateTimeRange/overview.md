# Overview for `DateTimeRange`

## Description

Encapsulates a start and end [DateTime] that represent the range of dates.

 The range includes the [start] and [end] dates. The [start] and [end] dates
 may be equal to indicate a date range of a single day. The [start] date must
 not be after the [end] date.

 See also:
  * [showDateRangePicker], which displays a dialog that allows the user to
    select a date range.

## Members

- **start**: `T`
  The start of the range of dates.

- **end**: `T`
  The end of the range of dates.

## Constructors

### Unnamed Constructor
Creates a date range for the given start and end [DateTime].


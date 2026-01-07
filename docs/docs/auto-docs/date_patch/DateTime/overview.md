# Overview for `DateTime`

## Description



## Members

- **_MICROSECOND_INDEX**: `dynamic`
- **_MILLISECOND_INDEX**: `dynamic`
- **_SECOND_INDEX**: `dynamic`
- **_MINUTE_INDEX**: `dynamic`
- **_HOUR_INDEX**: `dynamic`
- **_DAY_INDEX**: `dynamic`
- **_WEEKDAY_INDEX**: `dynamic`
- **_MONTH_INDEX**: `dynamic`
- **_YEAR_INDEX**: `dynamic`
- **_value**: `int`
  The value of this DateTime, equal to [microsecondsSinceEpoch].

- **__parts**: `List&lt;int&gt;?`
- **_sentinel**: `dynamic`
- **_sentinelConstraint**: `dynamic`
- **_sentinelAssertion**: `dynamic`
- **_DAYS_UNTIL_MONTH**: `List&lt;List&lt;int&gt;&gt;`
  The first list contains the days until each month in non-leap years. The
 second list contains the days in leap years.

## Constructors

### _
Constructor for pre-validated components.

#### Parameters

- `_value`: `dynamic`
- ``: `dynamic`
### _withValue
Constructs a new [DateTime] instance with the given value.

 If [isUtc] is false, then the date is in the local time zone.

#### Parameters

- `_value`: `dynamic`
- ``: `dynamic`
### fromMillisecondsSinceEpoch


#### Parameters

- `millisecondsSinceEpoch`: `int`
- ``: `dynamic`
### fromMicrosecondsSinceEpoch


#### Parameters

- `microsecondsSinceEpoch`: `int`
- ``: `dynamic`
### _internal


#### Parameters

- `year`: `int`
- `month`: `int`
- `day`: `int`
- `hour`: `int`
- `minute`: `int`
- `second`: `int`
- `millisecond`: `int`
- `microsecond`: `int`
- `isUtc`: `bool`
### _now


### _nowUtc



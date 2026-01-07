# Overview for `DateTime`

## Description



## Members

- **_value**: `int`
  The value component of this DateTime, equal to [millisecondsSinceEpoch].

- **_microsecond**: `int`
  The [microsecond] component of this DateTime, in the range [0...999].

- **_sentinel**: `dynamic`
- **_sentinelConstraint**: `dynamic`
- **_sentinelAssertion**: `dynamic`
## Constructors

### _
Constructor for pre-validated components.

#### Parameters

- `_value`: `dynamic`
- `_microsecond`: `dynamic`
- ``: `dynamic`
### _withValueChecked
Constructs a new [DateTime] instance with the given value.

 If [isUtc] is false, then the date is in the local time zone.

#### Parameters

- `millisecondsSinceEpoch`: `int`
- `microsecond`: `int`
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



# Method: `nextInt`

## Description

Generates a non-negative random integer uniformly distributed in the range
 from 0, inclusive, to [max], exclusive.

 Implementation note: The default implementation supports [max] values
 between 1 and (1<<32) inclusive.

 Example:
 ```dart
 var intValue = .nextInt(10); // Value is >= 0 and < 10.
 intValue = .nextInt(100) + 50; // Value is >= 50 and < 150.
 ```

## Return Type
`int`

## Parameters

- `max`: `int`

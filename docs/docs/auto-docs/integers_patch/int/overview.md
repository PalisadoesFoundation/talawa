# Overview for `int`

## Description

VM implementation of int.

## Members

- **_PARSE_LIMITS**: `dynamic`
- **_maxInt64**: `dynamic`
- **_minInt64**: `dynamic`
- **_int64UnsignedOverflowLimits**: `dynamic`
- **_int64UnsignedSmiOverflowLimits**: `dynamic`
- **_int64OverflowLimits**: `Int64List`
  Calculation of the expression

   result = (result * multiplier) + (sign * smi)

 in `` may overflow 64-bit integers. In such case,
 `int.` should stop with an error.

 This table is lazily filled with int64 overflow limits for result and smi.
 For each multiplier from `_PARSE_LIMITS[tableIndex + 1]` this table
 contains

 * `[tableIndex*2]` = positive limit for result
 * `[tableIndex*2 + 1]` = negative limit for result
 * `[tableIndex*2 + 2]` = limit for smi if result is exactly at positive limit
 * `[tableIndex*2 + 3]` = limit for smi if result is exactly at negative limit

## Constructors

### fromEnvironment


#### Parameters

- `name`: `String`
- ``: `dynamic`

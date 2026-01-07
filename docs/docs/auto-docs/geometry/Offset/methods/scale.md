# Method: `scale`

## Description

Returns a new offset with the x component scaled by `scaleX` and the y
 component scaled by `scaleY`.

 If the two scale arguments are the same, consider using the `*` operator
 instead:

 ```dart
 Offset a = const Offset(10.0, 10.0);
 Offset b = a * 2.0; // same as: a.scale(2.0, 2.0)
 ```

 If the two arguments are -1, consider using the unary `-` operator
 instead:

 ```dart
 Offset a = const Offset(10.0, 10.0);
 Offset b = -a; // same as: a.scale(-1.0, -1.0)
 ```

## Return Type
`Offset`

## Parameters

- `scaleX`: `double`
- `scaleY`: `double`

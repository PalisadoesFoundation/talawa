# Method: `translate`

## Description

Returns a new offset with translateX added to the x component and
 translateY added to the y component.

 If the arguments come from another [Offset], consider using the `+` or `-`
 operators instead:

 ```dart
 Offset a = const Offset(10.0, 10.0);
 Offset b = const Offset(10.0, 10.0);
 Offset c = a + b; // same as: a.translate(b.dx, b.dy)
 Offset d = a - b; // same as: a.translate(-b.dx, -b.dy)
 ```

## Return Type
`Offset`

## Parameters

- `translateX`: `double`
- `translateY`: `double`

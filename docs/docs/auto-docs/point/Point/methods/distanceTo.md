# Method: `distanceTo`

## Description

Returns the distance between `this` and [other].
 ```dart
 var distanceTo = const Point(0, 0).distanceTo(const Point(0, 0)); // 0.0
 distanceTo = const Point(0, 0).distanceTo(const Point(10, 0)); // 10.0
 distanceTo = const Point(0, 0).distanceTo(const Point(0, -10)); // 10.0
 distanceTo = const Point(-10, 0).distanceTo(const Point(100, 0)); // 110.0
 ```

## Return Type
`double`

## Parameters

- `other`: `Point&lt;T&gt;`

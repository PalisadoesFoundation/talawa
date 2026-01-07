# Method: `squaredDistanceTo`

## Description

Returns the squared distance between `this` and [other].

 Squared distances can be used for comparisons when the actual value is not
 required.

 Example:
 ```dart
 var squaredDistance =
     const Point(0, 0).squaredDistanceTo(const Point(0, 0)); // 0.0
 squaredDistance =
     const Point(0, 0).squaredDistanceTo(const Point(10, 0)); // 100
 squaredDistance =
     const Point(0, 0).squaredDistanceTo(const Point(0, -10)); // 100
 squaredDistance =
     const Point(-10, 0).squaredDistanceTo(const Point(100, 0)); // 12100
 ```

## Return Type
`T`

## Parameters

- `other`: `Point&lt;T&gt;`

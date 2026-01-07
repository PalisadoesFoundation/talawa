# Overview for `Point`

## Description

A utility class for representing two-dimensional positions.

 Example:
 ```dart
 var leftTop = const Point(0, 0);
 var rightBottom = const Point(200, 400);
 ```

 **Legacy:** New usages of [Point] are discouraged.

 - If you are using the `Point` class with `dart:html`,
   we recommend migrating to `package:web`.
   To learn how and why to migrate,
   check out the [migration guide](https://dart.dev/go/package-web).
 - If you want to combine an `x` and `y` coordinate,
   consider using a [record](https://dart.dev/language/records).
   Depending on how you will use it, this could look
   like `var point = (x, y)` or `var point = (x: x, y: y)`.
 - If you want to perform vector operations,
   like vector addition or scalar multiplication,
   consider using a dedicated vector math library,
   such as [`package:vector_math`](https://pub.dev/packages/vector_math).
 - If you are developing a Flutter application or package,
   consider using the
   [`Offset`](https://api.flutter.dev/flutter/dart-ui/Offset-class.html)
   type from `dart:ui`.

## Members

- **x**: `T`
- **y**: `T`
## Constructors

### Unnamed Constructor
Creates a point with the provided [x] and [y] coordinates.

 **Legacy:** New usages of [Point] are discouraged.
 To learn more, check out the [Point] class API docs.


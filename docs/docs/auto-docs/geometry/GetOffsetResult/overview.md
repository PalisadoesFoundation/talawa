# Overview for `GetOffsetResult`

## Description

The result of the [GetOffset] command.

 The offset is provided in logical pixels, which can be translated
 to device pixels via [dart:ui.FlutterView.devicePixelRatio].

## Dependencies

- Result

## Members

- **dx**: `double`
  The x component of the offset in logical pixels.

 The value can be translated to device pixels via
 [dart:ui.FlutterView.devicePixelRatio].

- **dy**: `double`
  The y component of the offset in logical pixels.

 The value can be translated to device pixels via
 [dart:ui.FlutterView.devicePixelRatio].

## Constructors

### Unnamed Constructor
Creates a result with the offset defined by [dx] and [dy].


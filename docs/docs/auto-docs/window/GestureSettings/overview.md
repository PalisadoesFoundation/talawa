# Overview for `GestureSettings`

## Description

Platform specific configuration for gesture behavior, such as touch slop.

 These settings are provided via [FlutterView.gestureSettings] to each
 view, and should be favored for configuring gesture behavior over the
 framework constants.

 A `null` field indicates that the platform or view does not have a preference
 and the fallback constants should be used instead.

## Members

- **physicalTouchSlop**: `double?`
  The number of physical pixels a pointer is allowed to drift before it is
 considered an intentional movement.

 If `null`, the framework's default touch slop configuration should be used
 instead.

- **physicalDoubleTapSlop**: `double?`
  The number of physical pixels that the first and second tap of a double tap
 can drift apart to still be recognized as a double tap.

 If `null`, the framework's default double tap slop configuration should be used
 instead.

## Constructors

### Unnamed Constructor
Create a new [GestureSettings] value.

 Consider using [GestureSettings.copyWith] on an existing settings object
 to ensure that newly added fields are correctly set.


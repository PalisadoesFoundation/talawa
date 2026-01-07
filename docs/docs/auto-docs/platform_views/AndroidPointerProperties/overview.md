# Overview for `AndroidPointerProperties`

## Description

Properties of an Android pointer.

 A Dart version of Android's [MotionEvent.PointerProperties](https://developer.android.com/reference/android/view/MotionEvent.PointerProperties).

## Members

- **id**: `int`
  See Android's [MotionEvent.PointerProperties#id](https://developer.android.com/reference/android/view/MotionEvent.PointerProperties.html#id).

- **toolType**: `int`
  The type of tool used to make contact such as a finger or stylus, if known.
 See Android's [MotionEvent.PointerProperties#toolType](https://developer.android.com/reference/android/view/MotionEvent.PointerProperties.html#toolType).

- **kToolTypeUnknown**: `int`
  Value for `toolType` when the tool type is unknown.

- **kToolTypeFinger**: `int`
  Value for `toolType` when the tool type is a finger.

- **kToolTypeStylus**: `int`
  Value for `toolType` when the tool type is a stylus.

- **kToolTypeMouse**: `int`
  Value for `toolType` when the tool type is a mouse.

- **kToolTypeEraser**: `int`
  Value for `toolType` when the tool type is an eraser.

## Constructors

### Unnamed Constructor
Creates an [AndroidPointerProperties] object.


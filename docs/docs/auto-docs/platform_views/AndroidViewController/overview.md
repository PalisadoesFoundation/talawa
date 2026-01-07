# Overview for `AndroidViewController`

## Description

Controls an Android view that is composed using a GL texture.

 Typically created with [PlatformViewsService.initAndroidView].

## Dependencies

- PlatformViewController

## Members

- **kActionDown**: `int`
  Action code for when a primary pointer touched the screen.

 Android's [MotionEvent.ACTION_DOWN](https://developer.android.com/reference/android/view/MotionEvent#ACTION_DOWN)

- **kActionUp**: `int`
  Action code for when a primary pointer stopped touching the screen.

 Android's [MotionEvent.ACTION_UP](https://developer.android.com/reference/android/view/MotionEvent#ACTION_UP)

- **kActionMove**: `int`
  Action code for when the event only includes information about pointer movement.

 Android's [MotionEvent.ACTION_MOVE](https://developer.android.com/reference/android/view/MotionEvent#ACTION_MOVE)

- **kActionCancel**: `int`
  Action code for when a motion event has been canceled.

 Android's [MotionEvent.ACTION_CANCEL](https://developer.android.com/reference/android/view/MotionEvent#ACTION_CANCEL)

- **kActionPointerDown**: `int`
  Action code for when a secondary pointer touched the screen.

 Android's [MotionEvent.ACTION_POINTER_DOWN](https://developer.android.com/reference/android/view/MotionEvent#ACTION_POINTER_DOWN)

- **kActionPointerUp**: `int`
  Action code for when a secondary pointer stopped touching the screen.

 Android's [MotionEvent.ACTION_POINTER_UP](https://developer.android.com/reference/android/view/MotionEvent#ACTION_POINTER_UP)

- **kAndroidLayoutDirectionLtr**: `int`
  Android's [View.LAYOUT_DIRECTION_LTR](https://developer.android.com/reference/android/view/View.html#LAYOUT_DIRECTION_LTR) value.

- **kAndroidLayoutDirectionRtl**: `int`
  Android's [View.LAYOUT_DIRECTION_RTL](https://developer.android.com/reference/android/view/View.html#LAYOUT_DIRECTION_RTL) value.

- **kInputDeviceSourceUnknown**: `int`
  Android's [InputDevice.SOURCE_UNKNOWN](https://developer.android.com/reference/android/view/InputDevice#SOURCE_UNKNOWN)

- **kInputDeviceSourceTouchScreen**: `int`
  Android's [InputDevice.SOURCE_TOUCHSCREEN](https://developer.android.com/reference/android/view/InputDevice#SOURCE_TOUCHSCREEN)

- **kInputDeviceSourceMouse**: `int`
  Android's [InputDevice.SOURCE_MOUSE](https://developer.android.com/reference/android/view/InputDevice#SOURCE_MOUSE)

- **kInputDeviceSourceStylus**: `int`
  Android's [InputDevice.SOURCE_STYLUS](https://developer.android.com/reference/android/view/InputDevice#SOURCE_STYLUS)

- **kInputDeviceSourceTouchPad**: `int`
  Android's [InputDevice.SOURCE_TOUCHPAD](https://developer.android.com/reference/android/view/InputDevice#SOURCE_TOUCHPAD)

- **viewId**: `int`
  The unique identifier of the Android view controlled by this controller.

- **_viewType**: `String`
- **_motionEventConverter**: `_AndroidMotionEventConverter`
- **_layoutDirection**: `TextDirection`
- **_state**: `_AndroidViewState`
- **_creationParams**: `_CreationParams?`
- **_platformViewCreatedCallbacks**: `List&lt;PlatformViewCreatedCallback&gt;`
## Constructors

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

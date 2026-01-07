# Method: `sendMotionEvent`

## Description

Sends an Android [MotionEvent](https://developer.android.com/reference/android/view/MotionEvent)
 to the view.

 The Android MotionEvent object is created with [MotionEvent.obtain](https://developer.android.com/reference/android/view/MotionEvent.html#obtain(long,%20long,%20int,%20float,%20float,%20float,%20float,%20int,%20float,%20float,%20int,%20int)).
 See documentation of [MotionEvent.obtain](https://developer.android.com/reference/android/view/MotionEvent.html#obtain(long,%20long,%20int,%20float,%20float,%20float,%20float,%20int,%20float,%20float,%20int,%20int))
 for description of the parameters.

 See [AndroidViewController.dispatchPointerEvent] for sending a
 [PointerEvent].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `event`: `AndroidMotionEvent`

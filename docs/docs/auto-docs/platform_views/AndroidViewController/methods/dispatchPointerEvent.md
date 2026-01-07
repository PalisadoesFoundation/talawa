# Method: `dispatchPointerEvent`

## Description

Converts the [PointerEvent] and sends an Android [MotionEvent](https://developer.android.com/reference/android/view/MotionEvent)
 to the view.

 This method can only be used if a [PointTransformer] is provided to
 [AndroidViewController.pointTransformer]. Otherwise, an [AssertionError]
 is thrown. See [AndroidViewController.sendMotionEvent] for sending a
 `MotionEvent` without a [PointTransformer].

 The Android MotionEvent object is created with [MotionEvent.obtain](https://developer.android.com/reference/android/view/MotionEvent.html#obtain(long,%20long,%20int,%20float,%20float,%20float,%20float,%20int,%20float,%20float,%20int,%20int)).
 See documentation of [MotionEvent.obtain](https://developer.android.com/reference/android/view/MotionEvent.html#obtain(long,%20long,%20int,%20float,%20float,%20float,%20float,%20int,%20float,%20float,%20int,%20int))
 for description of the parameters.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `event`: `PointerEvent`

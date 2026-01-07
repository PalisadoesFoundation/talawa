# Method: `startStylusHandwriting`

## Description

Tell Android to begin receiving stylus handwriting input.

 This is typically called after detecting a [PointerDownEvent] from a
 [PointerDeviceKind.stylus] on an active text field, indicating the start
 of stylus handwriting input. If there is no active [TextInputConnection],
 the call will be ignored.

 Call [isFeatureAvailable] each time before calling this to make sure that
 stylus handwriting input is supported and available.

 Supported on Android API 33 and above.

 See also:

 * <https://developer.android.com/reference/android/view/inputmethod/InputMethodManager#startStylusHandwriting(android.view.View)>,
   which is the corresponding API on Android that this method attempts to
   mirror.
  * [EditableText.stylusHandwritingEnabled], which controls whether
    Flutter's built-in text fields support handwriting input.

## Return Type
`Future&lt;void&gt;`


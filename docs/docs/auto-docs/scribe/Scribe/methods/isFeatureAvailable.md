# Method: `isFeatureAvailable`

## Description

A convenience method to check if the device currently supports Scribe
 stylus handwriting input.

 Call this each time before calling [startStylusHandwriting] to make sure
 it's available.

 
 This example shows using [isFeatureAvailable] to confirm that
 [startStylusHandwriting] can be called.

 ```dart
 if (!await Scribe.) 

 // Scribe is supported, so start it.
 Scribe.;
 ```
 

 See also:

 * [isStylusHandwritingAvailable], which is similar, but throws an error
   when called by an unsupported API level. It directly corresponds to the
   underlying Android API
   <https://developer.android.com/reference/android/view/inputmethod/InputMethodManager#>.
  * [EditableText.stylusHandwritingEnabled], which controls whether
    Flutter's built-in text fields support handwriting input.

## Return Type
`Future&lt;bool&gt;`


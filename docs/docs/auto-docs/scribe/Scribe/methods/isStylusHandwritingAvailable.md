# Method: `isStylusHandwritingAvailable`

## Description

Returns true if the InputMethodManager supports Scribe stylus handwriting
 input, false otherwise.

 Call this each time before calling [startStylusHandwriting] to make sure
 it's available.

 Supported on Android API 34 and above. If called by an unsupported API
 level, a [PlatformException] will be thrown. To avoid error handling, use
 the convenience method [isFeatureAvailable] instead.

 
 This example shows using [isStylusHandwritingAvailable] to confirm that
 [startStylusHandwriting] can be called.

 ```dart
 try  on PlatformException catch (exception) 

 // Scribe is supported, so start it.
 Scribe.;
 ```
 

 See also:

 * <https://developer.android.com/reference/android/view/inputmethod/InputMethodManager#>,
   which is the corresponding API on Android that this method attempts to
   mirror.

## Return Type
`Future&lt;bool&gt;`


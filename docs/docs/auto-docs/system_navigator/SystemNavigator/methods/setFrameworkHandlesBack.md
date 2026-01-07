# Method: `setFrameworkHandlesBack`

## Description

Informs the platform of whether or not the Flutter framework will handle
 back events.

 Currently, this is used only on Android to inform its use of the
 predictive back gesture when exiting the app. When true, predictive back
 is disabled.

 See also:

  * The
    [migration guide](https://developer.android.com/guide/navigation/predictive-back-gesture)
    for predictive back in native Android apps.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `frameworkHandlesBack`: `bool`

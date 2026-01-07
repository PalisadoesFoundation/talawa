# Method: `warmUpOnCanvas`

## Description

Trigger draw operations on a given canvas to warm up GPU shader
 compilation cache.

 To decide which draw operations to be added to your custom warm up
 process, consider capturing an skp using `flutter screenshot
 --vm-service-uri=<uri> --type=skia` and analyzing it with
 <https://debugger.skia.org/>. Alternatively, one may run the app with
 `flutter run --trace-skia` and then examine the raster thread in the
 Flutter DevTools timeline to see which Skia draw operations are commonly used,
 and which shader compilations are causing jank.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `canvas`: `ui.Canvas`

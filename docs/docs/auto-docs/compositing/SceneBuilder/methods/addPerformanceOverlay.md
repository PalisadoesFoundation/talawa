# Method: `addPerformanceOverlay`

## Description

Adds an object to the scene that displays performance statistics.

 Useful during development to assess the performance of the application.
 The enabledOptions controls which statistics are displayed. The bounds
 controls where the statistics are displayed.

 enabledOptions is a bit field with the following bits defined:
  - 0x01: displayRasterizerStatistics - show raster thread frame time
  - 0x02: visualizeRasterizerStatistics - graph raster thread frame times
  - 0x04: displayEngineStatistics - show UI thread frame time
  - 0x08: visualizeEngineStatistics - graph UI thread frame times
 Set enabledOptions to 0x0F to enable all the currently defined features.

 The "UI thread" is the thread that includes all the execution of the main
 Dart isolate (the isolate that can call [FlutterView.render]). The UI
 thread frame time is the total time spent executing the
 [PlatformDispatcher.onBeginFrame] callback. The "raster thread" is the
 thread (running on the CPU) that subsequently processes the [Scene]
 provided by the Dart code to turn it into GPU commands and send it to the
 GPU.

 See also the [PerformanceOverlayOption] enum in the rendering library.
 for more details.

## Return Type
`void`

## Parameters

- `enabledOptions`: `int`
- `bounds`: `Rect`

# Method: `screenshot`

## Description

Take a screenshot.

 The image will be returned as a PNG.

 **Warning:** This is not reliable.

 There is a two-second artificial delay before screenshotting. The delay
 here is to deal with a race between the driver script and the raster
 thread (formerly known as the GPU thread). The issue is that the driver
 API synchronizes with the framework based on transient callbacks, which
 are out of sync with the raster thread.

 Here's the timeline of events in ASCII art:

     ---------------------------------------------------------------
     Without this delay:
     ---------------------------------------------------------------
     UI    : <-- build -->
     Raster:               <-- rasterize -->
     Gap   :              | random |
     Driver:                        <-- screenshot -->

 In the diagram above, the gap is the time between the last driver action
 taken, such as a ``, and the subsequent call to ``. The
 gap is random because it is determined by the unpredictable communication
 channel between the driver process and the application. If this gap is too
 short, which it typically will be, the screenshot is taken before the
 raster thread is done rasterizing the frame, so the screenshot of the
 previous frame is taken, which is not what is intended.

     ---------------------------------------------------------------
     With this delay, if we're lucky:
     ---------------------------------------------------------------
     UI    : <-- build -->
     Raster:               <-- rasterize -->
     Gap   :              |    2 seconds or more   |
     Driver:                                        <-- screenshot -->

 The two-second gap should be long enough for the raster thread to finish
 rasterizing the frame, but not longer than necessary to keep driver tests
 as fast a possible.

     ---------------------------------------------------------------
     With this delay, if we're not lucky:
     ---------------------------------------------------------------
     UI    : <-- build -->
     Raster:               <-- rasterize randomly slow today -->
     Gap   :              |    2 seconds or more   |
     Driver:                                        <-- screenshot -->

 In practice, sometimes the device gets really busy for a while and even
 two seconds isn't enough, which means that this is still racy and a source
 of flakes.

## Return Type
`Future&lt;List&lt;int&gt;&gt;`

## Parameters

- ``: `dynamic`

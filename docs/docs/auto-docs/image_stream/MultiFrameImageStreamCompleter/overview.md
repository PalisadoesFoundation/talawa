# Overview for `MultiFrameImageStreamCompleter`

## Description

Manages the decoding and scheduling of image frames.

 New frames will only be emitted while there are registered listeners to the
 stream (registered with [addListener]).

 This class deals with 2 types of frames:

  * image frames - image frames of an animated image.
  * app frames - frames that the flutter engine is drawing to the screen to
    show the app GUI.

 For single frame images the stream will only complete once.

 For animated images, this class eagerly decodes the next image frame,
 and notifies the listeners that a new frame is ready on the first app frame
 that is scheduled after the image frame duration has passed.

 Scheduling new timers only from scheduled app frames, makes sure we pause
 the animation when the app is not visible (as new app frames will not be
 scheduled).

 See the following timeline example:

     | Time | Event                                      | Comment                   |
     |------|--------------------------------------------|---------------------------|
     | t1   | App frame scheduled (image frame A posted) |                           |
     | t2   | App frame scheduled                        |                           |
     | t3   | App frame scheduled                        |                           |
     | t4   | Image frame B decoded                      |                           |
     | t5   | App frame scheduled                        | t5 - t1 < frameB_duration |
     | t6   | App frame scheduled (image frame B posted) | t6 - t1 > frameB_duration |

## Dependencies

- ImageStreamCompleter

## Members

- **_chunkSubscription**: `StreamSubscription&lt;ImageChunkEvent&gt;?`
- **_codec**: `ui.Codec?`
- **_scale**: `double`
- **_informationCollector**: `InformationCollector?`
- **_nextFrame**: `ui.FrameInfo?`
- **_shownTimestamp**: `Duration`
- **_frameDuration**: `Duration?`
- **_framesEmitted**: `int`
- **_timer**: `Timer?`
- **_frameCallbackScheduled**: `bool`
## Constructors

### Unnamed Constructor
Creates a image stream completer.

 Immediately starts decoding the first image frame when the codec is ready.

 The `codec` parameter is a future for an initialized [ui.Codec] that will
 be used to decode the image. This completer takes ownership of the passed
 `codec` and will dispose it once it is no longer needed.

 The `scale` parameter is the linear scale factor for drawing this frames
 of this image at their intended size.

 The `tag` parameter is passed on to created [ImageInfo] objects to
 help identify the source of the image.

 The `chunkEvents` parameter is an optional stream of notifications about
 the loading progress of the image. If this stream is provided, the events
 produced by the stream will be delivered to registered [ImageChunkListener]s
 (see [addListener]).


# Method: `now`

## Description

The current time stamp from the clock used by the timeline in
 microseconds.

 When run on the Dart VM, uses the same monotonic clock as the embedding
 API's `Dart_TimelineGetMicros`.

 When run on the web, uses `window.performance.now`.

 This is a drop-in replacement for [Timeline.now].

## Return Type
`int`


# Method: `sample`

## Description

Dispatch resampled pointer events for the specified `sampleTime`
 by calling [callback].

 This may dispatch multiple events if position is not the only
 state that has changed since last sample.

 Calling [callback] must not add or sample events.

 Positive value for `nextSampleTime` allow early processing of
 up and removed events. This improves resampling of these events,
 which is important for fling animations.

## Return Type
`void`

## Parameters

- `sampleTime`: `Duration`
- `nextSampleTime`: `Duration`
- `callback`: `HandleEventCallback`

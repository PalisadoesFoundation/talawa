# Overview for `VelocityTracker`

## Description

Computes a pointer's velocity based on data from [PointerMoveEvent]s.

 The input data is provided by calling [addPosition]. Adding data is cheap.

 To obtain a velocity, call [getVelocity] or [getVelocityEstimate]. This will
 compute the velocity based on the data added so far. Only call these when
 you need to use the velocity, as they are comparatively expensive.

 The quality of the velocity estimation will be better if more data points
 have been received.

## Members

- **_assumePointerMoveStoppedMilliseconds**: `int`
- **_historySize**: `int`
- **_horizonMilliseconds**: `int`
- **_minSampleSize**: `int`
- **kind**: `PointerDeviceKind`
  The kind of pointer this tracker is for.

- **_stopwatch**: `Stopwatch?`
- **_samples**: `List<_PointAtTime?>`
- **_index**: `int`
## Constructors

### withKind
Create a new velocity tracker for a pointer [kind].

#### Parameters

- `kind`: `dynamic`

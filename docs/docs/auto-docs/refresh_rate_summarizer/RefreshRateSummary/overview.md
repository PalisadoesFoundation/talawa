# Overview for `RefreshRateSummary`

## Description

A summary of [TimelineEvent]s corresponding to `kUIThreadVsyncProcessEvent` events.

 `RefreshRate` is the time between the start of a vsync pulse and the target time of that vsync.

## Members

- **_kErrorMargin**: `double`
- **_numberOf30HzFrames**: `int`
- **_numberOf60HzFrames**: `int`
- **_numberOf80HzFrames**: `int`
- **_numberOf90HzFrames**: `int`
- **_numberOf120HzFrames**: `int`
- **_numberOfTotalFrames**: `int`
- **_framesWithIllegalRefreshRate**: `List&lt;double&gt;`
## Constructors

### Unnamed Constructor
Creates a [RefreshRateSummary] given the timeline events.


# Overview for `FrameRequestPendingLatencySummarizer`

## Description

Summarizes [TimelineEvent]s corresponding to [kFrameRequestPendingEvent] events.

 `FrameRequestPendingLatency` is the time between `Animator::RequestFrame`
 and `Animator::BeginFrame` for each frame built by the Flutter engine.

## Members

- **frameRequestPendingEvents**: `List&lt;TimelineEvent&gt;`
  Timeline events with names in [kFrameRequestPendingEvent].

## Constructors

### Unnamed Constructor
Creates a FrameRequestPendingLatencySummarizer given the timeline events.


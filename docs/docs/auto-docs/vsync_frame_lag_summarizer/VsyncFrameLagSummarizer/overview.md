# Overview for `VsyncFrameLagSummarizer`

## Description

Summarizes [TimelineEvent]s corresponding to [kVsyncTimelineEventNames] events.

 `VsyncFrameLag` is the time between when a platform vsync event is received to
 when the frame starts getting processed by the Flutter Engine. This delay is
 typically seen due to non-frame workload related dart tasks being scheduled
 on the UI thread.

## Members

- **vsyncEvents**: `List&lt;TimelineEvent&gt;`
  Timeline events with names in [kVsyncTimelineEventNames].

## Constructors

### Unnamed Constructor
Creates a VsyncFrameLagSummarizer given the timeline events.


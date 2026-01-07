# Overview for `SceneDisplayLagSummarizer`

## Description

Summarizes [TimelineEvent]s corresponding to [kSceneDisplayLagEvent] events.

 A sample event (some fields have been omitted for brevity):
 ```json
     ,
 ```

 `vsync_transitions_missed` corresponds to the elapsed number of frame budget
 durations between when the frame was scheduled to be displayed, i.e, the
 `frame_target_time` and the next vsync pulse timestamp, i.e, the
 `current_frame_target_time`.

## Members

- **sceneDisplayLagEvents**: `List&lt;TimelineEvent&gt;`
  The scene display lag events.

## Constructors

### Unnamed Constructor
Creates a SceneDisplayLagSummarizer given the timeline events.


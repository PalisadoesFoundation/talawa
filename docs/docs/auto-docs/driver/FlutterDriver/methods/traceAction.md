# Method: `traceAction`

## Description

Runs [action] and outputs a performance trace for it.

 Waits for the `Future` returned by [action] to complete prior to stopping
 the trace.

 This is merely a convenience wrapper on top of [startTracing] and
 [stopTracingAndDownloadTimeline].

 [streams] limits the recorded timeline event streams to only the ones
 listed. By default, all streams are recorded.

 If [retainPriorEvents] is true, retains events recorded prior to calling
 [action]. Otherwise, prior events are cleared before calling [action]. By
 default, prior events are cleared.

 If this is run in debug mode, a warning message will be printed to suggest
 running the benchmark in profile mode instead.

 For [WebFlutterDriver], this is only supported for Chrome.

## Return Type
`Future&lt;Timeline&gt;`

## Parameters

- `action`: `Future&lt;dynamic&gt; `
- ``: `dynamic`
- ``: `dynamic`

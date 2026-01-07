# Method: `pause`

## Description

Requests that the stream pauses events until further notice.

 While paused, the subscription will not fire any events.
 If it receives events from its source, they will be buffered until
 the subscription is resumed.
 For non-broadcast streams, the underlying source is usually informed
 about the pause,
 so it can stop generating events until the subscription is resumed.

 To avoid buffering events on a broadcast stream, it is better to
 cancel this subscription, and start to listen again when events
 are needed, if the intermediate events are not important.

 If [resumeSignal] is provided, the stream subscription will undo the pause
 when the future completes, as if by a call to [resume].
 If the future completes with an error,
 the stream will still resume, but the error will be considered unhandled
 and is passed to [Zone.handleUncaughtError].

 A call to [resume] will also undo a pause.

 If the subscription is paused more than once, an equal number
 of resumes must be performed to resume the stream.
 Calls to [resume] and the completion of a [resumeSignal] are
 interchangeable - the [pause] which was passed a [resumeSignal] may be
 ended by a call to [resume], and completing the [resumeSignal] may end a
 different [pause].

 It is safe to [resume] or complete a [resumeSignal] even when the
 subscription is not paused, and the resume will have no effect.

## Return Type
`void`

## Parameters

- ``: `dynamic`

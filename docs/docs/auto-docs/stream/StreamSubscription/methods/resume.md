# Method: `resume`

## Description

Resumes after a pause.

 This undoes one previous call to [pause].
 When all previously calls to [pause] have been matched by a calls to
 [resume], possibly through a `resumeSignal` passed to [pause],
 the stream subscription may emit events again.

 It is safe to [resume] even when the subscription is not paused, and the
 resume will have no effect.

## Return Type
`void`


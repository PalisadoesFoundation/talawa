# Method: `resume`

## Description

Resumes a paused isolate.

 Sends a message to an isolate requesting that it ends a pause
 that was previously requested.

 When all active pause requests have been cancelled, the isolate
 will continue processing events and handling normal messages.

 If the [resumeCapability] is not one that has previously been used
 to pause the isolate, or it has already been used to resume from
 that pause, the resume call has no effect.

## Return Type
`void`

## Parameters

- `resumeCapability`: `Capability`

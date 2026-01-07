# Method: `attach`

## Description

Attaches this finalizer to [value].

 When [value] is no longer accessible to the program,
 while still having an attachment to this finalizer,
 the callback of this finalizer *may* be called
 with [finalizationToken] as argument.
 The callback may be called at most once per active attachment,
 ones which have not been detached by calling [Finalizer.detach].

 The [detach] value is only used by the finalizer to identify the current
 attachment. If a non-`null` [detach] value is provided, the same
 (identical) value can be passed to [Finalizer.detach] to remove the
 attachment. If no (non-`null`) value is provided, the attachment cannot
 be removed again.

 The [value] and [detach] arguments do not count towards those
 objects being accessible to the program.
 Both must be objects supported as an [Expando] key.
 They may be the *same* object.

 Example:
 ```dart
 class Database 
 ```

 Multiple objects may be attached using the same finalization token,
 and the finalizer can be attached multiple times to the same object
 with different, or the same, finalization token.

## Return Type
`void`

## Parameters

- `value`: `Object`
- `finalizationToken`: `T`
- ``: `dynamic`

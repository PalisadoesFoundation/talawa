# Method: `restoreOffset`

## Description

Called by [context] to restore the scroll offset to the provided value.

 The provided value has previously been provided to the [context] by
 calling [ScrollContext.saveOffset], e.g. from [saveOffset].

 This method may be called right after the scroll position is created
 before layout has occurred. In that case, `initialRestore` is set to true
 and the viewport dimensions will not be known yet. If the [context]
 doesn't have any information to restore the scroll offset this method is
 not called.

 The method may be called multiple times in the lifecycle of a
 [ScrollPosition] to restore it to different scroll offsets.

## Return Type
`void`

## Parameters

- `offset`: `double`
- ``: `dynamic`

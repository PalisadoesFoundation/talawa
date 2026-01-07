# Method: `needsDelegateRebuild`

## Description

Should be used by subclasses to invalidate any cached data from the
 [delegate].

 This value is set to false after [layoutChildSequence]. If
 [markNeedsLayout] is called `withDelegateRebuild` set to true, then this
 value will be updated to true, signifying any cached delegate information
 needs to be updated in the next call to [layoutChildSequence].

 Subclasses are not required to use this value, but it can be used to
 safely cache layout information in between layout calls.

## Return Type
`bool`


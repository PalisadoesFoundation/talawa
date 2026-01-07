# Method: `alwaysNeedsCompositing`

## Description

Whether this render object always needs compositing.

 Override this in subclasses to indicate that your paint function always
 creates at least one composited layer. For example, videos should return
 true if they use hardware decoders.

 You must call [markNeedsCompositingBitsUpdate] if the value of this getter
 changes. (This is implied when [adoptChild] or [dropChild] are called.)

## Return Type
`bool`


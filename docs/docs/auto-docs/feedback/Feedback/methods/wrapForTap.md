# Method: `wrapForTap`

## Description

Wraps a [GestureTapCallback] to provide platform specific feedback for a
 tap before the provided callback is executed.

 On Android the platform-typical click system sound is played. On iOS this
 is a no-op as that platform usually doesn't provide feedback for a tap.

 See also:

  * [forTap] to just trigger the platform-specific feedback without wrapping
    a [GestureTapCallback].

## Return Type
`GestureTapCallback?`

## Parameters

- `callback`: `GestureTapCallback?`
- `context`: `BuildContext`

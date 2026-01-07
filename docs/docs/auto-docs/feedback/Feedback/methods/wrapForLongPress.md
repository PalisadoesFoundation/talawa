# Method: `wrapForLongPress`

## Description

Wraps a [GestureLongPressCallback] to provide platform specific feedback
 for a long press before the provided callback is executed.

 On Android the platform-typical vibration is triggered. On iOS a
 heavy-impact haptic feedback is triggered alongside the click system
 sound, which was observed to be the default behavior on a physical iPhone
 15 Pro running iOS version 17.5.

 See also:

  * [forLongPress] to just trigger the platform-specific feedback without
    wrapping a [GestureLongPressCallback].

## Return Type
`GestureLongPressCallback?`

## Parameters

- `callback`: `GestureLongPressCallback?`
- `context`: `BuildContext`

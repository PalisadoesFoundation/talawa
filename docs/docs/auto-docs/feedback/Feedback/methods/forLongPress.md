# Method: `forLongPress`

## Description

Provides platform-specific feedback for a long press.

 On Android the platform-typical vibration is triggered. On iOS a
 heavy-impact haptic feedback is triggered alongside the click system
 sound, which was observed to be the default behavior on a physical iPhone
 15 Pro running iOS version 17.5.

 See also:

  * [wrapForLongPress] to trigger platform-specific feedback before
    executing a [GestureLongPressCallback].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `context`: `BuildContext`

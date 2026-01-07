# Method: `activity`

## Description

The currently operative [ScrollActivity].

 If the scroll position is not performing any more specific activity, the
 activity will be an [IdleScrollActivity]. To determine whether the scroll
 position is idle, check the [isScrollingNotifier].

 Call [beginActivity] to change the current activity.

## Return Type
`ScrollActivity?`


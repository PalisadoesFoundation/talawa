# Method: `toStringDetails`

## Description

Provides a string describing the status of this object, but not including
 information about the object itself.

 This function is used by [Animation.toString] so that [Animation]
 subclasses can provide additional details while ensuring all [Animation]
 subclasses have a consistent [toString] style.

 The result of this function includes an icon describing the status of this
 [Animation] object:

 * "&#x25B6;": [AnimationStatus.forward] ([value] increasing)
 * "&#x25C0;": [AnimationStatus.reverse] ([value] decreasing)
 * "&#x23ED;": [AnimationStatus.completed] ([value] == 1.0)
 * "&#x23EE;": [AnimationStatus.dismissed] ([value] == 0.0)

## Return Type
`String`


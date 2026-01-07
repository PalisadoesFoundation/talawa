# Method: `selection`

## Description

Setting this will notify all the listeners of this [TextEditingController]
 that they need to update (it calls [notifyListeners]). For this reason,
 this value should only be set between frames, e.g. in response to user
 actions, not during the build, layout, or paint phases.

 This property can be set from a listener added to this
 [TextEditingController]; however, one should not also set [text]
 in a separate statement. To change both the [text] and the [selection]
 change the controller's [value].

 If the new selection is outside the composing range, the composing range is
 cleared.

## Parameters

- `newSelection`: `TextSelection`

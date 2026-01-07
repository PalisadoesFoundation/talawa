# Method: `text`

## Description

Updates the current [text] to the given `newText`, and removes existing
 selection and composing range held by the controller.

 This setter is typically only used in tests, as it resets the cursor
 position and the composing state. For production code, **consider using the
 [value] setter to update the [text] value instead**, and specify a
 reasonable selection range within the new [text].

 Setting this notifies all the listeners of this [TextEditingController]
 that they need to update (it calls [notifyListeners]). For this reason,
 this value should only be set between frames, e.g. in response to user
 actions, not during the build, layout, or paint phases. This property can
 be set from a listener added to this [TextEditingController].

## Parameters

- `newText`: `String`

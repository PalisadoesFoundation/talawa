# Method: `buildHandle`

## Description

Builds a selection handle of the given `type`.

 The top left corner of this widget is positioned at the bottom of the
 selection position.

 The supplied [onTap] should be invoked when the handle is tapped, if such
 interaction is allowed. As a counterexample, the default selection handle
 on iOS [cupertinoTextSelectionControls] does not call [onTap] at all,
 since its handles are not meant to be tapped.

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
- `type`: `TextSelectionHandleType`
- `textLineHeight`: `double`
- ``: `dynamic`

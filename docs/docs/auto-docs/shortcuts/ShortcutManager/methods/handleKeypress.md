# Method: `handleKeypress`

## Description

Handles a key press `event` in the given `context`.

 If a key mapping is found, then the associated action will be invoked
 using the [Intent] activated by the [ShortcutActivator] in the [shortcuts]
 map, and the currently focused widget's context (from
 [FocusManager.primaryFocus]).

 Returns a [KeyEventResult.handled] if an action was invoked, otherwise a
 [KeyEventResult.skipRemainingHandlers] if [modal] is true, or if it maps
 to a [DoNothingAction] with [DoNothingAction.consumesKey] set to false,
 and in all other cases returns [KeyEventResult.ignored].

 In order for an action to be invoked (and [KeyEventResult.handled]
 returned), a [ShortcutActivator] must accept the given [KeyEvent], be
 mapped to an [Intent], the [Intent] must be mapped to an [Action], and the
 [Action] must be enabled.

## Return Type
`KeyEventResult`

## Parameters

- `context`: `BuildContext`
- `event`: `KeyEvent`

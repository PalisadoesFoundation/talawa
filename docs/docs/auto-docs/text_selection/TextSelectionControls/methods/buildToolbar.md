# Method: `buildToolbar`

## Description

Builds a toolbar near a text selection.

 Typically displays buttons for copying and pasting text.

 The [globalEditableRegion] parameter is the TextField size of the global
 coordinate system in logical pixels.

 The [textLineHeight] parameter is the [RenderEditable.preferredLineHeight]
 of the [RenderEditable] we are building a toolbar for.

 The [selectionMidpoint] parameter is a general calculation midpoint
 parameter of the toolbar. More detailed position information
 is computable from the [endpoints] parameter.

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
- `globalEditableRegion`: `Rect`
- `textLineHeight`: `double`
- `selectionMidpoint`: `Offset`
- `endpoints`: `List&lt;TextSelectionPoint&gt;`
- `delegate`: `TextSelectionDelegate`
- `clipboardStatus`: `ValueListenable&lt;ClipboardStatus&gt;?`
- `lastSecondaryTapDownPosition`: `Offset?`

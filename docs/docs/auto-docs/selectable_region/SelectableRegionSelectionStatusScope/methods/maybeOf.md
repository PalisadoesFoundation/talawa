# Method: `maybeOf`

## Description

The closest instance of this class that encloses the given context.

 If there is no enclosing [SelectableRegion] or [SelectionArea] widget, then null is
 returned.

 Calling this method will create a dependency on the closest
 [SelectableRegionSelectionStatusScope] in the [context], if there is one.

## Return Type
`ValueListenable&lt;SelectableRegionSelectionStatus&gt;?`

## Parameters

- `context`: `BuildContext`

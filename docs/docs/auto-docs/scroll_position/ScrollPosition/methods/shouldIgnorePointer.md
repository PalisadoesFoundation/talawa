# Method: `shouldIgnorePointer`

## Description

Whether scrollables should absorb pointer events at this position.

 This is value relates to the current [ScrollActivity], which determines
 if additional touch input should be received by the scroll view or its children.
 If the position is overscrolled, as is allowed by [BouncingScrollPhysics],
 children of the scroll view will receive pointer events as the scroll view
 settles back from the overscrolled state.

## Return Type
`bool`


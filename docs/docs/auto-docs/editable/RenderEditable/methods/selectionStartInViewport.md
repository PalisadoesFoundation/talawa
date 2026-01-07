# Method: `selectionStartInViewport`

## Description

Track whether position of the start of the selected text is within the viewport.

 For example, if the text contains "Hello World", and the user selects
 "Hello", then scrolls so only "World" is visible, this will become false.
 If the user scrolls back so that the "H" is visible again, this will
 become true.

 This bool indicates whether the text is scrolled so that the handle is
 inside the text field viewport, as opposed to whether it is actually
 visible on the screen.

## Return Type
`ValueListenable&lt;bool&gt;`


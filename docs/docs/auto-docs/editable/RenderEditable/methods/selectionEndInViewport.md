# Method: `selectionEndInViewport`

## Description

Track whether position of the end of the selected text is within the viewport.

 For example, if the text contains "Hello World", and the user selects
 "World", then scrolls so only "Hello" is visible, this will become
 'false'. If the user scrolls back so that the "d" is visible again, this
 will become 'true'.

 This bool indicates whether the text is scrolled so that the handle is
 inside the text field viewport, as opposed to whether it is actually
 visible on the screen.

## Return Type
`ValueListenable&lt;bool&gt;`


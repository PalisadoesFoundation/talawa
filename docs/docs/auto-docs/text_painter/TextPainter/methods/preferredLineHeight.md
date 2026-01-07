# Method: `preferredLineHeight`

## Description

The height of a space in [text] in logical pixels.

 Not every line of text in [text] will have this height, but this height
 is "typical" for text in [text] and useful for sizing other objects
 relative a typical line of text.

 Obtaining this value does not require calling [layout].

 The style of the [text] property is used to determine the font settings
 that contribute to the [preferredLineHeight]. If [text] is null or if it
 specifies no styles, the default [TextStyle] values are used (a 10 pixel
 sans-serif font).

## Return Type
`double`


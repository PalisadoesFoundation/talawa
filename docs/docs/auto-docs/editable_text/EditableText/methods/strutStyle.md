# Method: `strutStyle`

## Description


 The strut style used for the vertical layout.

 [StrutStyle] is used to establish a predictable vertical layout.
 Since fonts may vary depending on user input and due to font
 fallback, [StrutStyle.forceStrutHeight] is enabled by default
 to lock all lines to the height of the base [TextStyle], provided by
 [style]. This ensures the typed text fits within the allotted space.

 If null, the strut used will inherit values from the [style] and will
 have [StrutStyle.forceStrutHeight] set to true. When no [style] is
 passed, the theme's [TextStyle] will be used to generate [strutStyle]
 instead.

 To disable strut-based vertical alignment and allow dynamic vertical
 layout based on the glyphs typed, use [StrutStyle.disabled].

 Flutter's strut is based on [typesetting strut](https://en.wikipedia.org/wiki/Strut_(typesetting))
 and CSS's [line-height](https://www.w3.org/TR/CSS2/visudet.html#line-height).
 

 Within editable text and text fields, [StrutStyle] will not use its standalone
 default values, and will instead inherit omitted/null properties from the
 [TextStyle] instead. See [StrutStyle.inheritFromTextStyle].

## Return Type
`StrutStyle`


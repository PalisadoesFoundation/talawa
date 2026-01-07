# Method: `inheritFromTextStyle`

## Description

Returns a new strut style that inherits its null values from
 corresponding properties in the [other] [TextStyle].

 The "missing" properties of the this strut style are _filled_ by
 the properties of the provided [TextStyle]. This is possible because
 [StrutStyle] shares many of the same basic properties as [TextStyle].

 If the given text style is null, returns this strut style.

## Return Type
`StrutStyle`

## Parameters

- `other`: `TextStyle?`

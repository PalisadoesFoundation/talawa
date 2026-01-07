# Method: `synonyms`

## Description

Returns a set of pseudo-key synonyms for the given `key`.

 This allows finding the pseudo-keys that also represent a concrete `key`
 so that a class with a key map can match pseudo-keys as well as the actual
 generated keys.

 Pseudo-keys returned in the set are typically used to represent keys which
 appear in multiple places on the keyboard, such as the [shift], [alt],
 [control], and [meta] keys. Pseudo-keys in the returned set won't ever be
 generated directly, but if a more specific key event is received, then
 this set can be used to find the more general pseudo-key. For example, if
 this is a [shiftLeft] key, this accessor will return the set
 `<LogicalKeyboardKey>`.

## Return Type
`Set&lt;LogicalKeyboardKey&gt;`


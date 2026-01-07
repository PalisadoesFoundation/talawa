# Method: `keyLabel`

## Description

A description representing the character produced by a [RawKeyEvent].

 This value is useful for providing readable strings for keys or keyboard
 shortcuts. Do not use this value to compare equality of keys; compare
 [keyId] instead.

 For printable keys, this is usually the printable character in upper case
 ignoring modifiers or combining keys, such as 'A', '1', or '/'. This
 might also return accented letters (such as 'Ù') for keys labeled as so,
 but not if such character is a result from preceding combining keys ('`̀'
 followed by key U).

 For other keys, [keyLabel] looks up the full key name from a predefined
 map, such as 'F1', 'Shift Left', or 'Media Down'. This value is an empty
 string if there's no key label data for a key.

 For the printable representation that takes into consideration the
 modifiers and combining keys, see [RawKeyEvent.character].

 

## Return Type
`String`


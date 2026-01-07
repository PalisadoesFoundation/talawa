# Method: `hasBody`

## Description

Whether or not this function has a body.

 This is useful when augmenting a function, so you know whether an
 `augment super` call would be valid or not.

 Note that for external functions, this may return `false` even though
 there is actually a body that is filled in later by another tool.

## Return Type
`bool`


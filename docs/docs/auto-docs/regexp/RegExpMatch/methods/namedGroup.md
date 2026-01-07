# Method: `namedGroup`

## Description

The string captured by the named capture group [name].

 Returns the substring of the input that the
 labeled capture group, labeled [name], matched,
 or `null` if that capture group was not part of the match.

 The [name] must be the name of a named capture group in the regular
 expression [pattern] which created this match.
 That is, the name must be in [groupNames].

## Return Type
`String?`

## Parameters

- `name`: `String`

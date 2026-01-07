# Method: `isDotAll`

## Description

Whether "." in this regular expression matches line terminators.

 When false, the "." character matches a single character, unless that
 character terminates a line. When true, then the "." character will
 match any single character including line terminators.

 This feature is distinct from [isMultiLine]. They affect the behavior
 of different pattern characters, so they can be used together or
 separately.

## Return Type
`bool`


# Method: `debugName`

## Description

The debug string to print for this keyboard key, which will be null in
 release mode.

 For printable keys, this is usually a more descriptive name related to
 [keyLabel], such as 'Key A', 'Digit 1', 'Backslash'. This might
 also return accented letters (such as 'Key Ù') for keys labeled as so.

 For other keys, this looks up the full key name from a predefined map (the
 same value as [keyLabel]), such as 'F1', 'Shift Left', or 'Media Down'. If
 there's no key label data for a key, this returns a name that explains the
 ID (such as 'Key with ID 0x00100012345').

## Return Type
`String?`


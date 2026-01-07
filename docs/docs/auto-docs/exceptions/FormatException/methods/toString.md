# Method: `toString`

## Description

Returns a description of the format exception.

 The description always contains the [message].

 If [source] is present and is a string, the description will contain
 (at least a part of) the source.
 If [offset] is also provided, the part of the source included will
 contain that offset, and the offset will be marked.

 If the source is a string and it contains a line break before offset,
 only the line containing offset will be included, and its line number
 will also be part of the description. Line and character offsets are
 1-based.

## Return Type
`String`


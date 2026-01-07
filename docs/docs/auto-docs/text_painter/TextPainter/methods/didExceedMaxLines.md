# Method: `didExceedMaxLines`

## Description

Whether any text was truncated or ellipsized.

 If [maxLines] is not null, this is true if there were more lines to be
 drawn than the given [maxLines], and thus at least one line was omitted in
 the output; otherwise it is false.

 If [maxLines] is null, this is true if [ellipsis] is not the empty string
 and there was a line that overflowed the `maxWidth` argument passed to
 [layout]; otherwise it is false.

 Valid only after [layout] has been called.

## Return Type
`bool`


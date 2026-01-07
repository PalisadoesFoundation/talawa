# Method: `mergeResults`

## Description

Merges two lists of spell check [SuggestionSpan]s.

 Used in cases where the text has not changed, but the spell check results
 received from the shell side have. This case is caused by IMEs (GBoard,
 for instance) that ignore the composing region when spell checking text.

 Assumes that the lists provided as parameters are sorted by range start
 and that both list of [SuggestionSpan]s apply to the same text.

## Return Type
`List&lt;SuggestionSpan&gt;`

## Parameters

- `oldResults`: `List&lt;SuggestionSpan&gt;`
- `newResults`: `List&lt;SuggestionSpan&gt;`

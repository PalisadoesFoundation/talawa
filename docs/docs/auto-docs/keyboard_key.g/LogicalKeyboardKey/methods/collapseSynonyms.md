# Method: `collapseSynonyms`

## Description

Takes a set of keys, and returns the same set, but with any keys that have
 synonyms replaced.

 It is used, for example, to take sets of keys with members like
 [controlRight] and [controlLeft] and convert that set to contain just
 [control], so that the question "is any control key down?" can be asked.

## Return Type
`Set&lt;LogicalKeyboardKey&gt;`

## Parameters

- `input`: `Set&lt;LogicalKeyboardKey&gt;`

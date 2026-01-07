# Method: `expandSynonyms`

## Description

Returns the given set with any pseudo-keys expanded into their synonyms.

 It is used, for example, to take sets of keys with members like [control]
 and [shift] and convert that set to contain [controlLeft], [controlRight],
 [shiftLeft], and [shiftRight].

## Return Type
`Set&lt;LogicalKeyboardKey&gt;`

## Parameters

- `input`: `Set&lt;LogicalKeyboardKey&gt;`

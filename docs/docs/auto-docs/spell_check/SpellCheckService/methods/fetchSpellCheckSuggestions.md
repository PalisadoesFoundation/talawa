# Method: `fetchSpellCheckSuggestions`

## Description

Facilitates a spell check request.

 Returns a [Future] that resolves with a [List] of [SuggestionSpan]s for
 all misspelled words in the given [String] for the given [Locale].

 A return value that resolves to null indicates that fetching the spell
 check suggestions was unsuccessful. If fetching the suggestions succeeded
 but none were found, the [Future] should resolve to an empty list.

## Return Type
`Future&lt;List<SuggestionSpan&gt;?>`

## Parameters

- `locale`: `Locale`
- `text`: `String`

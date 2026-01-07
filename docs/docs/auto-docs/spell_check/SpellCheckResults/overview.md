# Overview for `SpellCheckResults`

## Description

A data structure grouping together the [SuggestionSpan]s and related text of
 results returned by a spell checker.

## Members

- **spellCheckedText**: `String`
  The text that the [suggestionSpans] correspond to.

- **suggestionSpans**: `List&lt;SuggestionSpan&gt;`
  The spell check results of the [spellCheckedText].

 See also:

  * [SuggestionSpan], the ranges of misspelled text and corresponding
    replacement suggestions.

## Constructors

### Unnamed Constructor
Creates results based off those received by spell checking some text input.


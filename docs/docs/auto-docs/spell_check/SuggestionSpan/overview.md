# Overview for `SuggestionSpan`

## Description

A data structure representing a range of misspelled text and the suggested
 replacements for this range.

 For example, one [SuggestionSpan] of the
 [List&lt;SuggestionSpan&gt;] suggestions of the [SpellCheckResults] corresponding
 to "Hello, wrold!" may be:
 ```dart
 SuggestionSpan suggestionSpan =
   const SuggestionSpan(
     TextRange(start: 7, end: 12),
     <String>['word', 'world', 'old'],
 );
 ```

## Members

- **range**: `TextRange`
  The misspelled range of text.

- **suggestions**: `List&lt;String&gt;`
  The alternate suggestions for the misspelled range of text.

## Constructors

### Unnamed Constructor
Creates a span representing a misspelled range of text and the replacements
 suggested by a spell checker.

 The [range] and replacement [suggestions] must all not
 be null.


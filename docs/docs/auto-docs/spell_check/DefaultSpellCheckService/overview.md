# Overview for `DefaultSpellCheckService`

## Description

The service used by default to fetch spell check results for text input.

 Any widget may use this service to spell check text by calling
 `fetchSpellCheckSuggestions(locale, text)` with an instance of this class.
 This is currently only supported by Android and iOS.

 See also:

  * [SpellCheckService], the service that this implements that may be
    overridden for use by [EditableText].
  * [EditableText], which may use this service to fetch results.

## Dependencies

- SpellCheckService

## Members

- **lastSavedResults**: `SpellCheckResults?`
  The last received results from the shell side.

- **spellCheckChannel**: `MethodChannel`
  The channel used to communicate with the shell side to complete spell
 check requests.

## Constructors

### Unnamed Constructor
Creates service to spell check text input by default via communication
 over the spell check [MethodChannel].


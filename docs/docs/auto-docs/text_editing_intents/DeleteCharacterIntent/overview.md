# Overview for `DeleteCharacterIntent`

## Description

Deletes the character before or after the caret location, based on whether
 `forward` is true.

 
 

 Typically a text field will not respond to this intent if it has no active
 caret ([TextSelection.isValid] is false for the current selection).

## Dependencies

- DirectionalTextEditingIntent

## Constructors

### Unnamed Constructor
Creates a [DeleteCharacterIntent].


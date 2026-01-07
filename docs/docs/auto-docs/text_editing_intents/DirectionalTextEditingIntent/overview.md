# Overview for `DirectionalTextEditingIntent`

## Description

A text editing related [Intent] that performs an operation towards a given
 direction of the current caret location.

## Dependencies

- Intent

## Members

- **forward**: `bool`
  Whether the input field, if applicable, should perform the text editing
 operation from the current caret location towards the end of the document.

 Unless otherwise specified by the recipient of this intent, this parameter
 uses the logical order of characters in the string to determine the
 direction, and is not affected by the writing direction of the text.

## Constructors

### Unnamed Constructor
Creates a [DirectionalTextEditingIntent].


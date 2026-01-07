# Overview for `ReplaceTextIntent`

## Description

An [Intent] that represents a user interaction that attempts to modify the
 current [TextEditingValue] in an input field.

## Dependencies

- Intent

## Members

- **currentTextEditingValue**: `TextEditingValue`
  The [TextEditingValue] that this [Intent]'s action should perform on.

- **replacementText**: `String`
  The text to replace the original text within the [replacementRange] with.

- **replacementRange**: `TextRange`
  The range of text in [currentTextEditingValue] that needs to be replaced.

- **cause**: `SelectionChangedCause`
  

## Constructors

### Unnamed Constructor
Creates a [ReplaceTextIntent].


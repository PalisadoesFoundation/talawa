# Overview for `CopySelectionTextIntent`

## Description

An [Intent] that represents a user interaction that attempts to copy or cut
 the current selection in the field.

## Dependencies

- Intent

## Members

- **copy**: `CopySelectionTextIntent`
  An [Intent] that represents a user interaction that attempts to copy the
 current selection in the field.

- **cause**: `SelectionChangedCause`
  

- **collapseSelection**: `bool`
  Whether the original text needs to be removed from the input field if the
 copy action was successful.

## Constructors

### _


#### Parameters

- `cause`: `dynamic`
- `collapseSelection`: `dynamic`
### cut
Creates an [Intent] that represents a user interaction that attempts to
 cut the current selection in the field.

#### Parameters

- `cause`: `SelectionChangedCause`

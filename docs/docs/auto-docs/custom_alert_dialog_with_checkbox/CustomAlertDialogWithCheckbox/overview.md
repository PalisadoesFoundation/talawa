# Overview for `CustomAlertDialogWithCheckbox`

## Description

This Class returns CustomAlertDialogWithCheckbox widget . Custom Alert Dialog with check box is a popup.

 that appeared in the screen showing Alert message along with the event buttons.
 This extends stateful widget that means it cannot change its state during the
 runtime of a application.
 This has a check box which wil rewuire user input to change.

## Dependencies

- StatefulWidget

## Members

- **reverse**: `bool`
  Indicates whether the order of action buttons should be reversed.

- **success**: ` Function(bool?)`
  Function triggered upon tapping the primary action button.

- **secondaryButtonTap**: ` ?`
  Function triggered upon tapping the secondary action button.

- **successText**: `String`
  Text displayed on the primary action button.

- **dialogTitle**: `String`
  Title displayed in the dialog (default value is 'Confirmation').

- **dialogSubTitle**: `String`
  Subtitle or message content of the dialog.

- **secondaryButtonText**: `String`
  Text displayed on the secondary action button (default value is 'Close').

- **checkboxLabel**: `String`
  Label for the checkbox.

- **initialCheckboxValue**: `bool`
  Initial value for the checkbox.

## Constructors

### Unnamed Constructor



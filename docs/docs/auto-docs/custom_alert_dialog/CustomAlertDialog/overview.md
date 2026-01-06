# Overview for `CustomAlertDialog`

## Description

This Class returns CustomAlertDialog widget. Custom Alert Dialog is a popup.

 that appeared in the screen showing Alert message along with the event buttons.
 This extends stateless widget that means it cannot change its state during the
 runtime of a application.

## Dependencies

- StatelessWidget

## Members

- **reverse**: `bool`
  Indicates whether the order of action buttons should be reversed.

- **success**: ` `
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

## Constructors

### Unnamed Constructor
Constructs a [CustomAlertDialog] widget.

 [reverse] indicates whether the order of action buttons should be reversed.
 [success] is the function triggered upon tapping the primary action button.
 [secondaryButtonTap] is the function triggered upon tapping the secondary action button.
 [successText] is the text displayed on the primary action button.
 [dialogTitle] is the title displayed in the dialog (default value is 'Confirmation').
 [dialogSubTitle] is the subtitle or message content of the dialog.
 [secondaryButtonText] is the text displayed on the secondary action button (default value is 'Close').


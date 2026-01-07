# Overview for `SnackBarAction`

## Description

A button for a [SnackBar], known as an "action".

 Snack bar actions are always enabled. Instead of disabling a snack bar
 action, avoid including it in the snack bar in the first place.

 Snack bar actions can only be pressed once. Subsequent presses are ignored.

 See also:

  * [SnackBar]
  * <https://material.io/design/components/snackbars.html>

## Dependencies

- StatefulWidget

## Members

- **textColor**: `Color?`
  The button label color. If not provided, defaults to
 [SnackBarThemeData.actionTextColor].

 If [textColor] is a [WidgetStateColor], then the text color will be
 resolved against the set of [WidgetState]s that the action text
 is in, thus allowing for different colors for states such as pressed,
 hovered and others.

- **backgroundColor**: `Color?`
  The button background fill color. If not provided, defaults to
 [SnackBarThemeData.actionBackgroundColor].

 If [backgroundColor] is a [WidgetStateColor], then the text color will
 be resolved against the set of [WidgetState]s that the action text is
 in, thus allowing for different colors for the states.

- **disabledTextColor**: `Color?`
  The button disabled label color. This color is shown after the
 [SnackBarAction] is dismissed.

- **disabledBackgroundColor**: `Color?`
  The button disabled background color. This color is shown after the
 [SnackBarAction] is dismissed.

 If not provided, defaults to [SnackBarThemeData.disabledActionBackgroundColor].

- **label**: `String`
  The button label.

- **onPressed**: `VoidCallback`
  The callback to be called when the button is pressed.

 This callback will be called at most once each time this action is
 displayed in a [SnackBar].

## Constructors

### Unnamed Constructor
Creates an action for a [SnackBar].


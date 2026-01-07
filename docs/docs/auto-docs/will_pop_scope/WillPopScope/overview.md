# Overview for `WillPopScope`

## Description

Registers a callback to veto attempts by the user to dismiss the enclosing
 [ModalRoute].

 See also:

  * [ModalRoute.addScopedWillPopCallback] and [ModalRoute.removeScopedWillPopCallback],
    which this widget uses to register and unregister [onWillPop].
  * [Form], which provides an `onWillPop` callback that enables the form
    to veto a `pop` initiated by the app's back button.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **onWillPop**: `WillPopCallback?`
  Called to veto attempts by the user to dismiss the enclosing [ModalRoute].

 If the callback returns a Future that resolves to false, the enclosing
 route will not be popped.

## Constructors

### Unnamed Constructor
Creates a widget that registers a callback to veto attempts by the user to
 dismiss the enclosing [ModalRoute].


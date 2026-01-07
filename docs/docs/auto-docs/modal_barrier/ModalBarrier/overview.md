# Overview for `ModalBarrier`

## Description

A widget that prevents the user from interacting with widgets behind itself.

 The modal barrier is the scrim that is rendered behind each route, which
 generally prevents the user from interacting with the route below the
 current route, and normally partially obscures such routes.

 For example, when a dialog is on the screen, the page below the dialog is
 usually darkened by the modal barrier.

 See also:

  * [ModalRoute], which indirectly uses this widget.
  * [AnimatedModalBarrier], which is similar but takes an animated [color]
    instead of a single color value.

## Dependencies

- StatelessWidget

## Members

- **color**: `Color?`
  If non-null, fill the barrier with this color.

 See also:

  * [ModalRoute.barrierColor], which controls this property for the
    [ModalBarrier] built by [ModalRoute] pages.

- **dismissible**: `bool`
  Specifies if the barrier will be dismissed when the user taps on it.

 If true, and [onDismiss] is non-null, [onDismiss] will be called,
 otherwise the current route will be popped from the ambient [Navigator].

 If false, tapping on the barrier will do nothing.

 See also:

  * [ModalRoute.barrierDismissible], which controls this property for the
    [ModalBarrier] built by [ModalRoute] pages.

- **onDismiss**: `VoidCallback?`
  
 Called when the barrier is being dismissed.

 If non-null [onDismiss] will be called in place of popping the current
 route. It is up to the callback to handle dismissing the barrier.

 If null, the ambient [Navigator]'s current route will be popped.

 This field is ignored if [dismissible] is false.
 

- **barrierSemanticsDismissible**: `bool?`
  Whether the modal barrier semantics are included in the semantics tree.

 See also:

  * [ModalRoute.semanticsDismissible], which controls this property for
    the [ModalBarrier] built by [ModalRoute] pages.

- **semanticsLabel**: `String?`
  Semantics label used for the barrier if it is [dismissible].

 The semantics label is read out by accessibility tools (e.g. TalkBack
 on Android and VoiceOver on iOS) when the barrier is focused.

 See also:

  * [ModalRoute.barrierLabel], which controls this property for the
    [ModalBarrier] built by [ModalRoute] pages.

- **clipDetailsNotifier**: `ValueNotifier&lt;EdgeInsets&gt;?`
  
 Contains a value of type [EdgeInsets] that specifies how the
 [SemanticsNode.rect] of the widget should be clipped.

 See also:

  * [_SemanticsClipper], which utilizes the value inside to update the
 [SemanticsNode.rect] for its child.
 

- **semanticsOnTapHint**: `String?`
  

## Constructors

### Unnamed Constructor
Creates a widget that blocks user interaction.


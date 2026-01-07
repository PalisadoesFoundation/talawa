# Overview for `AnimatedModalBarrier`

## Description

A widget that prevents the user from interacting with widgets behind itself,
 and can be configured with an animated color value.

 The modal barrier is the scrim that is rendered behind each route, which
 generally prevents the user from interacting with the route below the
 current route, and normally partially obscures such routes.

 For example, when a dialog is on the screen, the page below the dialog is
 usually darkened by the modal barrier.

 This widget is similar to [ModalBarrier] except that it takes an animated
 [color] instead of a single color.

 See also:

  * [ModalRoute], which uses this widget.

## Dependencies

- AnimatedWidget

## Members

- **dismissible**: `bool`
  Whether touching the barrier will pop the current route off the [Navigator].

 See also:

  * [ModalRoute.barrierDismissible], which controls this property for the
    [AnimatedModalBarrier] built by [ModalRoute] pages.

- **semanticsLabel**: `String?`
  Semantics label used for the barrier if it is [dismissible].

 The semantics label is read out by accessibility tools (e.g. TalkBack
 on Android and VoiceOver on iOS) when the barrier is focused.
 See also:

  * [ModalRoute.barrierLabel], which controls this property for the
    [ModalBarrier] built by [ModalRoute] pages.

- **barrierSemanticsDismissible**: `bool?`
  Whether the modal barrier semantics are included in the semantics tree.

 See also:

  * [ModalRoute.semanticsDismissible], which controls this property for
    the [ModalBarrier] built by [ModalRoute] pages.

- **onDismiss**: `VoidCallback?`
  

- **clipDetailsNotifier**: `ValueNotifier&lt;EdgeInsets&gt;?`
  

- **semanticsOnTapHint**: `String?`
  This hint text instructs users what they are able to do when they tap on
 the [ModalBarrier]

 E.g. If the hint text is 'close bottom sheet", it will be announced as
 "Double tap to close bottom sheet".

 If this value is null, the default onTapHint will be applied, resulting
 in the announcement of 'Double tap to activate'.

## Constructors

### Unnamed Constructor
Creates a widget that blocks user interaction.


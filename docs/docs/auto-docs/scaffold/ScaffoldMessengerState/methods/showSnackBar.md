# Method: `showSnackBar`

## Description

Shows a [SnackBar] across all registered [Scaffold]s. Scaffolds register
 to receive snack bars from their closest [ScaffoldMessenger] ancestor.
 If there are several registered scaffolds the snack bar is shown
 simultaneously on all of them.

 A scaffold can show at most one snack bar at a time. If this function is
 called while another snack bar is already visible, the given snack bar
 will be added to a queue and displayed after the earlier snack bars have
 closed.

 To control how long a [SnackBar] remains visible, use [SnackBar.duration].

 To remove the [SnackBar] with an exit animation, use [hideCurrentSnackBar]
 or call [ScaffoldFeatureController.close] on the returned
 [ScaffoldFeatureController]. To remove a [SnackBar] suddenly (without an
 animation), use [removeCurrentSnackBar].

 See [ScaffoldMessenger.of] for information about how to obtain the
 [ScaffoldMessengerState].

 
 Here is an example of showing a [SnackBar] when the user presses a button.

 ** See code in examples/api/lib/material/scaffold/scaffold_messenger_state.show_snack_bar.0.dart **
 

 ## Relative positioning of floating SnackBars

 A [SnackBar] with [SnackBar.behavior] set to [SnackBarBehavior.floating] is
 positioned above the widgets provided to [Scaffold.floatingActionButton],
 [Scaffold.persistentFooterButtons], and [Scaffold.bottomNavigationBar].
 If some or all of these widgets take up enough space such that the SnackBar
 would not be visible when positioned above them, an error will be thrown.
 In this case, consider constraining the size of these widgets to allow room for
 the SnackBar to be visible.

 
 Here is an example showing how to display a [SnackBar] with [showSnackBar]

 ** See code in examples/api/lib/material/scaffold/scaffold_messenger_state.show_snack_bar.0.dart **
 

 
 Here is an example showing that a floating [SnackBar] appears above [Scaffold.floatingActionButton].

 ** See code in examples/api/lib/material/scaffold/scaffold_messenger_state.show_snack_bar.1.dart **
 

 If [AnimationStyle.duration] is provided in the [snackBarAnimationStyle]
 parameter, it will be used to override the snackbar show animation duration.
 Otherwise, defaults to 250ms.

 If [AnimationStyle.reverseDuration] is provided in the [snackBarAnimationStyle]
 parameter, it will be used to override the snackbar hide animation duration.
 Otherwise, defaults to 250ms.

 To disable the snackbar animation, use [AnimationStyle.noAnimation].

 
 This sample showcases how to override [SnackBar] show and hide animation
 duration using [AnimationStyle] in [ScaffoldMessengerState.showSnackBar].

 ** See code in examples/api/lib/material/scaffold/scaffold_messenger_state.show_snack_bar.2.dart **
 

## Return Type
`ScaffoldFeatureController&lt;SnackBar, SnackBarClosedReason&gt;`

## Parameters

- `snackBar`: `SnackBar`
- ``: `dynamic`

# Method: `showBottomSheet`

## Description

Shows a Material Design bottom sheet in the nearest [Scaffold]. To show
 a persistent bottom sheet, use the [Scaffold.bottomSheet].

 Returns a controller that can be used to close and otherwise manipulate the
 bottom sheet.

 To rebuild the bottom sheet (e.g. if it is stateful), call
 [PersistentBottomSheetController.setState] on the controller returned by
 this method.

 The new bottom sheet becomes a [LocalHistoryEntry] for the enclosing
 [ModalRoute] and a back button is added to the app bar of the [Scaffold]
 that closes the bottom sheet.

 The [transitionAnimationController] controls the bottom sheet's entrance and
 exit animations. It's up to the owner of the controller to call
 [AnimationController.dispose] when the controller is no longer needed.

 To create a persistent bottom sheet that is not a [LocalHistoryEntry] and
 does not add a back button to the enclosing Scaffold's app bar, use the
 [Scaffold.bottomSheet] constructor parameter.

 A persistent bottom sheet shows information that supplements the primary
 content of the app. A persistent bottom sheet remains visible even when
 the user interacts with other parts of the app.

 A closely related widget is a modal bottom sheet, which is an alternative
 to a menu or a dialog and prevents the user from interacting with the rest
 of the app. Modal bottom sheets can be created and displayed with the
 [showModalBottomSheet] function.

 
 This example demonstrates how to use [showBottomSheet] to display a
 bottom sheet when a user taps a button. It also demonstrates how to
 close a bottom sheet using the Navigator.

 ** See code in examples/api/lib/material/scaffold/scaffold_state.show_bottom_sheet.0.dart **
 

 The [sheetAnimationStyle] parameter is used to override the bottom sheet
 animation duration and reverse animation duration.

 If [AnimationStyle.duration] is provided, it will be used to override
 the bottom sheet animation duration in the underlying
 [BottomSheet.createAnimationController].

 If [AnimationStyle.reverseDuration] is provided, it will be used to
 override the bottom sheet reverse animation duration in the underlying
 [BottomSheet.createAnimationController].

 To disable the bottom sheet animation, use [AnimationStyle.noAnimation].

 
 This sample showcases how to override the [showBottomSheet] animation
 duration and reverse animation duration using [AnimationStyle].

 ** See code in examples/api/lib/material/scaffold/scaffold_state.show_bottom_sheet.1.dart **
 
 See also:

  * [BottomSheet], which becomes the parent of the widget returned by the
    `builder`.
  * [showBottomSheet], which calls this method given a [BuildContext].
  * [showModalBottomSheet], which can be used to display a modal bottom
    sheet.
  * [Scaffold.of], for information about how to obtain the [ScaffoldState].
  * The Material 2 spec at <https://m2.material.io/components/sheets-bottom>.
  * The Material 3 spec at <https://m3.material.io/components/bottom-sheets/overview>.
  * [AnimationStyle], which is used to override the modal bottom sheet
    animation duration and reverse animation duration.

## Return Type
`PersistentBottomSheetController`

## Parameters

- `builder`: `WidgetBuilder`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

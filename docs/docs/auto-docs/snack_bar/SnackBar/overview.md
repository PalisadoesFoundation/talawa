# Overview for `SnackBar`

## Description

A lightweight message with an optional action which briefly displays at the
 bottom of the screen.

 

 To display a snack bar, call `ScaffoldMessenger.of(context).`,
 passing an instance of [SnackBar] that describes the message.

 To control how long the [SnackBar] remains visible, specify a [duration].

 A SnackBar with an action will not time out when TalkBack or VoiceOver are
 enabled. This is controlled by [AccessibilityFeatures.accessibleNavigation].

 During page transitions, the [SnackBar] will smoothly animate to its
 location on the other page. For example if the [SnackBar.behavior] is set to
 [SnackBarBehavior.floating] and the next page has a floating action button,
 while the current one does not, the [SnackBar] will smoothly animate above
 the floating action button. It also works in the case of a back gesture
 transition.

 
 Here is an example of a [SnackBar] with an [action] button implemented using
 [SnackBarAction].

 ** See code in examples/api/lib/material/snack_bar/snack_bar.0.dart **
 

 
 Here is an example of a customized [SnackBar]. It utilizes
 [behavior], [shape], [padding], [width], and [duration] to customize the
 location, appearance, and the duration for which the [SnackBar] is visible.

 ** See code in examples/api/lib/material/snack_bar/snack_bar.1.dart **
 

 
 This example demonstrates the various [SnackBar] widget components,
 including an optional icon, in either floating or fixed format.

 ** See code in examples/api/lib/material/snack_bar/snack_bar.2.dart **
 

 See also:

  * [ScaffoldMessenger.of], to obtain the current [ScaffoldMessengerState],
    which manages the display and animation of snack bars.
  * [ScaffoldMessengerState.showSnackBar], which displays a [SnackBar].
  * [ScaffoldMessengerState.removeCurrentSnackBar], which abruptly hides the
    currently displayed snack bar, if any, and allows the next to be displayed.
  * [SnackBarAction], which is used to specify an [action] button to show
    on the snack bar.
  * [SnackBarThemeData], to configure the default property values for
    [SnackBar] widgets.
  * <https://material.io/design/components/snackbars.html>

## Dependencies

- StatefulWidget

## Members

- **content**: `Widget`
  The primary content of the snack bar.

 Typically a [Text] widget.

- **backgroundColor**: `Color?`
  The snack bar's background color.

 If not specified, it will use [SnackBarThemeData.backgroundColor] of
 [ThemeData.snackBarTheme]. If that is not specified it will default to a
 dark variation of [ColorScheme.surface] for light themes, or
 [ColorScheme.onSurface] for dark themes.

- **elevation**: `double?`
  The z-coordinate at which to place the snack bar. This controls the size
 of the shadow below the snack bar.

 Defines the card's [Material.elevation].

 If this property is null, then [SnackBarThemeData.elevation] of
 [ThemeData.snackBarTheme] is used, if that is also null, the default value
 is 6.0.

- **margin**: `EdgeInsetsGeometry?`
  Empty space to surround the snack bar.

 This property is only used when [behavior] is [SnackBarBehavior.floating].
 It can not be used if [width] is specified.

 If this property is null, then [SnackBarThemeData.insetPadding] of
 [ThemeData.snackBarTheme] is used. If that is also null, then the default is
 `EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0)`.

 If this property is not null and [hitTestBehavior] is null, then [hitTestBehavior] default is [HitTestBehavior.deferToChild].

- **padding**: `EdgeInsetsGeometry?`
  The amount of padding to apply to the snack bar's content and optional
 action.

 If this property is null, the default padding values are as follows:

 * [content]
     * Top and bottom paddings are 14.
     * Left padding is 24 if [behavior] is [SnackBarBehavior.fixed],
       16 if [behavior] is [SnackBarBehavior.floating].
     * Right padding is same as start padding if there is no [action],
       otherwise 0.
 * [action]
     * Top and bottom paddings are 14.
     * Left and right paddings are half of [content]'s left padding.

 If this property is not null, the padding is as follows:

 * [content]
     * Left, top and bottom paddings are assigned normally.
     * Right padding is assigned normally if there is no [action],
       otherwise 0.
 * [action]
     * Left padding is replaced with half the right padding.
     * Top and bottom paddings are assigned normally.
     * Right padding is replaced with one and a half times the
       right padding.

- **width**: `double?`
  The width of the snack bar.

 If width is specified, the snack bar will be centered horizontally in the
 available space. This property is only used when [behavior] is
 [SnackBarBehavior.floating]. It can not be used if [margin] is specified.

 If this property is null, then [SnackBarThemeData.width] of
 [ThemeData.snackBarTheme] is used. If that is null, the snack bar will
 take up the full device width less the margin.

- **shape**: `ShapeBorder?`
  The shape of the snack bar's [Material].

 Defines the snack bar's [Material.shape].

 If this property is null then [SnackBarThemeData.shape] of
 [ThemeData.snackBarTheme] is used. If that's null then the shape will
 depend on the [SnackBarBehavior]. For [SnackBarBehavior.fixed], no
 overriding shape is specified, so the [SnackBar] is rectangular. For
 [SnackBarBehavior.floating], it uses a [RoundedRectangleBorder] with a
 circular corner radius of 4.0.

- **hitTestBehavior**: `HitTestBehavior?`
  Defines how the snack bar area, including margin, will behave during hit testing.

 If this property is null, and [margin] is not null or [SnackBarThemeData.insetPadding] of
 [ThemeData.snackBarTheme] is not null, then [HitTestBehavior.deferToChild] is used by default.

 Please refer to [HitTestBehavior] for a detailed explanation of every behavior.

- **behavior**: `SnackBarBehavior?`
  This defines the behavior and location of the snack bar.

 Defines where a [SnackBar] should appear within a [Scaffold] and how its
 location should be adjusted when the scaffold also includes a
 [FloatingActionButton] or a [BottomNavigationBar]

 If this property is null, then [SnackBarThemeData.behavior] of
 [ThemeData.snackBarTheme] is used. If that is null, then the default is
 [SnackBarBehavior.fixed].

 If this value is [SnackBarBehavior.floating], the length of the bar
 is defined by either [width] or [margin].

- **action**: `SnackBarAction?`
  (optional) An action that the user can take based on the snack bar.

 For example, the snack bar might let the user undo the operation that
 prompted the snackbar. Snack bars can have at most one action.

 The action should not be "dismiss" or "cancel".

- **actionOverflowThreshold**: `double?`
  (optional) The percentage threshold for action widget's width before it overflows
 to a new line.

 Must be between 0 and 1.
 If the width of the [action] divided by the total snackbar width
 is greater than this percentage, the [action] will appear below the [content].

 At a value of 0, the action will always overflow to a new line.

 Defaults to 0.25.

- **showCloseIcon**: `bool?`
  (optional) Whether to include a "close" icon widget.

 Tapping the icon will close the snack bar.

- **closeIconColor**: `Color?`
  An optional color for the close icon, if [showCloseIcon] is
 true.

 If this property is null, then [SnackBarThemeData.closeIconColor] of
 [ThemeData.snackBarTheme] is used. If that is null, then the default is
 inverse surface.

 If [closeIconColor] is a [WidgetStateColor], then the icon color will be
 resolved against the set of [WidgetState]s that the action text
 is in, thus allowing for different colors for states such as pressed,
 hovered and others.

- **duration**: `Duration`
  The amount of time the snack bar should be displayed.

 Defaults to 4.0s.

 See also:

  * [ScaffoldMessengerState.removeCurrentSnackBar], which abruptly hides the
    currently displayed snack bar, if any, and allows the next to be
    displayed.
  * <https://material.io/design/components/snackbars.html>

- **animation**: `Animation&lt;double&gt;?`
  The animation driving the entrance and exit of the snack bar.

- **onVisible**: `VoidCallback?`
  Called the first time that the snackbar is visible within a [Scaffold].

 When multiple [Scaffold]s are registered to the same [ScaffoldMessengerState],
 [onVisible] is called once for each scaffold.

 See also:

  * [ScaffoldMessenger], which manages [SnackBar]s for [Scaffold] descendants.

- **dismissDirection**: `DismissDirection?`
  The direction in which the SnackBar can be dismissed.

 If this property is null, then [SnackBarThemeData.dismissDirection] of
 [ThemeData.snackBarTheme] is used. If that is null, then the default is
 [DismissDirection.down].

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

## Constructors

### Unnamed Constructor
Creates a snack bar.

 The [elevation] must be null or non-negative.


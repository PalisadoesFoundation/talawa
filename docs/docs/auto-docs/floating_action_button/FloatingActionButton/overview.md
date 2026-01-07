# Overview for `FloatingActionButton`

## Description

A Material Design floating action button.

 A floating action button is a circular icon button that hovers over content
 to promote a primary action in the application. Floating action buttons are
 most commonly used in the [Scaffold.floatingActionButton] field.

 

 Use at most a single floating action button per screen. Floating action
 buttons should be used for positive actions such as "create", "share", or
 "navigate". (If more than one floating action button is used within a
 [Route], then make sure that each button has a unique [heroTag], otherwise
 an exception will be thrown.)

 If the [onPressed] callback is null, then the button will be disabled and
 will not react to touch. It is highly discouraged to disable a floating
 action button as there is no indication to the user that the button is
 disabled. Consider changing the [backgroundColor] if disabling the floating
 action button.

 
 This example shows a [FloatingActionButton] in its usual position within a
 [Scaffold]. Pressing the button cycles it through a few variations in its
 [foregroundColor], [backgroundColor], and [shape]. The button automatically
 animates its segue from one set of visual parameters to another.

 ** See code in examples/api/lib/material/floating_action_button/floating_action_button.0.dart **
 

 
 This sample shows all the variants of [FloatingActionButton] widget as
 described in: https://m3.material.io/components/floating-action-button/overview.

 ** See code in examples/api/lib/material/floating_action_button/floating_action_button.1.dart **
 

 
 This sample shows [FloatingActionButton] with additional color mappings as
 described in: https://m3.material.io/components/floating-action-button/overview.

 ** See code in examples/api/lib/material/floating_action_button/floating_action_button.2.dart **
 

 See also:

  * [Scaffold], in which floating action buttons typically live.
  * [ElevatedButton], a filled button whose material elevates when pressed.
  * <https://material.io/design/components/buttons-floating-action-button.html>
  * <https://m3.material.io/components/floating-action-button>

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 Typically an [Icon].

- **tooltip**: `String?`
  Text that describes the action that will occur when the button is pressed.

 This text is displayed when the user long-presses on the button and is
 used for accessibility.

- **foregroundColor**: `Color?`
  The default foreground color for icons and text within the button.

 If this property is null, then the [FloatingActionButtonThemeData.foregroundColor]
 of [ThemeData.floatingActionButtonTheme] is used. If that property is also
 null, then the [ColorScheme.onPrimaryContainer] color of [ThemeData.colorScheme]
 is used. If [ThemeData.useMaterial3] is set to false, then the
 [ColorScheme.onSecondary] color of [ThemeData.colorScheme] is used.

- **backgroundColor**: `Color?`
  The button's background color.

 If this property is null, then the [FloatingActionButtonThemeData.backgroundColor]
 of [ThemeData.floatingActionButtonTheme] is used. If that property is also
 null, then the [ColorScheme.primaryContainer] color of [ThemeData.colorScheme]
 is used. If [ThemeData.useMaterial3] is set to false, then the
 [ColorScheme.secondary] color of [ThemeData.colorScheme] is used.

- **focusColor**: `Color?`
  The color to use for filling the button when the button has input focus.

 In Material3, defaults to [ColorScheme.onPrimaryContainer] with opacity 0.1.
 In Material 2, it defaults to [ThemeData.focusColor] for the current theme.

- **hoverColor**: `Color?`
  The color to use for filling the button when the button has a pointer
 hovering over it.

 Defaults to [ThemeData.hoverColor] for the current theme in Material 2. In
 Material 3, defaults to [ColorScheme.onPrimaryContainer] with opacity 0.08.

- **splashColor**: `Color?`
  The splash color for this [FloatingActionButton]'s [InkWell].

 If null, [FloatingActionButtonThemeData.splashColor] is used, if that is
 null, [ThemeData.splashColor] is used in Material 2; [ColorScheme.onPrimaryContainer]
 with opacity 0.1 is used in Material 3.

- **heroTag**: `Object?`
  The tag to apply to the button's [Hero] widget.

 Defaults to a tag that matches other floating action buttons.

 Set this to null explicitly if you don't want the floating action button to
 have a hero tag.

 If this is not explicitly set, then there can only be one
 [FloatingActionButton] per route (that is, per screen), since otherwise
 there would be a tag conflict (multiple heroes on one route can't have the
 same tag). The Material Design specification recommends only using one
 floating action button per screen.

- **onPressed**: `VoidCallback?`
  The callback that is called when the button is tapped or otherwise activated.

 If this is set to null, the button will be disabled.

- **mouseCursor**: `MouseCursor?`
  

 If this property is null, [WidgetStateMouseCursor.clickable] will be used.

- **elevation**: `double?`
  The z-coordinate at which to place this button relative to its parent.

 This controls the size of the shadow below the floating action button.

 Defaults to 6, the appropriate elevation for floating action buttons. The
 value is always non-negative.

 See also:

  * [highlightElevation], the elevation when the button is pressed.
  * [disabledElevation], the elevation when the button is disabled.

- **focusElevation**: `double?`
  The z-coordinate at which to place this button relative to its parent when
 the button has the input focus.

 This controls the size of the shadow below the floating action button.

 Defaults to 8, the appropriate elevation for floating action buttons
 while they have focus. The value is always non-negative.

 See also:

  * [elevation], the default elevation.
  * [highlightElevation], the elevation when the button is pressed.
  * [disabledElevation], the elevation when the button is disabled.

- **hoverElevation**: `double?`
  The z-coordinate at which to place this button relative to its parent when
 the button is enabled and has a pointer hovering over it.

 This controls the size of the shadow below the floating action button.

 Defaults to 8, the appropriate elevation for floating action buttons while
 they have a pointer hovering over them. The value is always non-negative.

 See also:

  * [elevation], the default elevation.
  * [highlightElevation], the elevation when the button is pressed.
  * [disabledElevation], the elevation when the button is disabled.

- **highlightElevation**: `double?`
  The z-coordinate at which to place this button relative to its parent when
 the user is touching the button.

 This controls the size of the shadow below the floating action button.

 Defaults to 12, the appropriate elevation for floating action buttons
 while they are being touched. The value is always non-negative.

 See also:

  * [elevation], the default elevation.

- **disabledElevation**: `double?`
  The z-coordinate at which to place this button when the button is disabled
 ([onPressed] is null).

 This controls the size of the shadow below the floating action button.

 Defaults to the same value as [elevation]. Setting this to zero makes the
 floating action button work similar to an [ElevatedButton] but the titular
 "floating" effect is lost. The value is always non-negative.

 See also:

  * [elevation], the default elevation.
  * [highlightElevation], the elevation when the button is pressed.

- **mini**: `bool`
  Controls the size of this button.

 By default, floating action buttons are non-mini and have a height and
 width of 56.0 logical pixels. Mini floating action buttons have a height
 and width of 40.0 logical pixels with a layout width and height of 48.0
 logical pixels. (The extra 4 pixels of padding on each side are added as a
 result of the floating action button having [MaterialTapTargetSize.padded]
 set on the underlying [RawMaterialButton.materialTapTargetSize].)

- **shape**: `ShapeBorder?`
  The shape of the button's [Material].

 The button's highlight and splash are clipped to this shape. If the
 button has an elevation, then its drop shadow is defined by this
 shape as well.

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.none].

- **isExtended**: `bool`
  True if this is an "extended" floating action button.

 Typically "extended" buttons have a [StadiumBorder] [shape]
 and have been created with the [FloatingActionButton.extended]
 constructor.

 The [Scaffold] animates the appearance of ordinary floating
 action buttons with scale and rotation transitions. Extended
 floating action buttons are scaled and faded in.

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  Configures the minimum size of the tap target.

 Defaults to [ThemeData.materialTapTargetSize].

 See also:

  * [MaterialTapTargetSize], for a description of how this affects tap targets.

- **enableFeedback**: `bool?`
  Whether detected gestures should provide acoustic and/or haptic feedback.

 For example, on Android a tap will produce a clicking sound and a
 long-press will produce a short vibration, when feedback is enabled.

 If null, [FloatingActionButtonThemeData.enableFeedback] is used.
 If both are null, then default value is true.

 See also:

  * [Feedback] for providing platform-specific feedback to certain actions.

- **extendedIconLabelSpacing**: `double?`
  The spacing between the icon and the label for an extended
 [FloatingActionButton].

 If null, [FloatingActionButtonThemeData.extendedIconLabelSpacing] is used.
 If that is also null, the default is 8.0.

- **extendedPadding**: `EdgeInsetsGeometry?`
  The padding for an extended [FloatingActionButton]'s content.

 If null, [FloatingActionButtonThemeData.extendedPadding] is used. If that
 is also null, the default is
 `EdgeInsetsDirectional.only(start: 16.0, end: 20.0)` if an icon is
 provided, and `EdgeInsetsDirectional.only(start: 20.0, end: 20.0)` if not.

- **extendedTextStyle**: `TextStyle?`
  The text style for an extended [FloatingActionButton]'s label.

 If null, [FloatingActionButtonThemeData.extendedTextStyle] is used. If
 that is also null, then [TextTheme.labelLarge] with a letter spacing of 1.2
 is used.

- **_floatingActionButtonType**: `_FloatingActionButtonType`
- **_extendedLabel**: `Widget?`
## Constructors

### Unnamed Constructor
Creates a circular floating action button.

 The [elevation], [highlightElevation], and [disabledElevation] parameters,
 if specified, must be non-negative.

### small
Creates a small circular floating action button.

 This constructor overrides the default size constraints of the floating
 action button.

 The [elevation], [focusElevation], [hoverElevation], [highlightElevation],
 and [disabledElevation] parameters, if specified, must be non-negative.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### large
Creates a large circular floating action button.

 This constructor overrides the default size constraints of the floating
 action button.

 The [elevation], [focusElevation], [hoverElevation], [highlightElevation],
 and [disabledElevation] parameters, if specified, must be non-negative.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### extended
Creates a wider [StadiumBorder]-shaped floating action button with
 an optional [icon] and a [label].

 The [elevation], [highlightElevation], and [disabledElevation] parameters,
 if specified, must be non-negative.

 See also:
  * <https://m3.material.io/components/extended-fab>

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

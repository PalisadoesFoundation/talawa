# Overview for `RawMaterialButton`

## Description

Creates a button based on [Semantics], [Material], and [InkWell]
 widgets.

 This class does not use the current [Theme] or [ButtonTheme] to
 compute default values for unspecified parameters. It's intended to
 be used for custom Material buttons that optionally incorporate defaults
 from the themes or from app-specific sources.

 This class is planned to be deprecated in a future release, see
 [ButtonStyleButton], the base class of [ElevatedButton], [FilledButton],
 [OutlinedButton] and [TextButton].

 See also:

  * [ElevatedButton], a filled button whose material elevates when pressed.
  * [FilledButton], a filled button that doesn't elevate when pressed.
  * [FilledButton.tonal], a filled button variant that uses a secondary fill color.
  * [OutlinedButton], a button with an outlined border and no fill color.
  * [TextButton], a button with no outline or fill color.

## Dependencies

- StatefulWidget

## Members

- **onPressed**: `VoidCallback?`
  Called when the button is tapped or otherwise activated.

 If this callback and [onLongPress] are null, then the button will be disabled.

 See also:

  * [enabled], which is true if the button is enabled.

- **onLongPress**: `VoidCallback?`
  Called when the button is long-pressed.

 If this callback and [onPressed] are null, then the button will be disabled.

 See also:

  * [enabled], which is true if the button is enabled.

- **onHighlightChanged**: `ValueChanged&lt;bool&gt;?`
  Called by the underlying [InkWell] widget's [InkWell.onHighlightChanged]
 callback.

 If [onPressed] changes from null to non-null while a gesture is ongoing,
 this can fire during the build phase (in which case calling
 [State.setState] is not allowed).

- **mouseCursor**: `MouseCursor?`
  
 The cursor for a mouse pointer when it enters or is hovering over the
 button.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.pressed].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].
 

 If this property is null, [WidgetStateMouseCursor.clickable] will be used.

- **textStyle**: `TextStyle?`
  Defines the default text style, with [Material.textStyle], for the
 button's [child].

 If [TextStyle.color] is a [WidgetStateProperty&lt;Color&gt;], [WidgetStateProperty.resolve]
 is used for the following [WidgetState]s:

  * [WidgetState.pressed].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

- **fillColor**: `Color?`
  The color of the button's [Material].

- **focusColor**: `Color?`
  The color for the button's [Material] when it has the input focus.

- **hoverColor**: `Color?`
  The color for the button's [Material] when a pointer is hovering over it.

- **highlightColor**: `Color?`
  The highlight color for the button's [InkWell].

- **splashColor**: `Color?`
  The splash color for the button's [InkWell].

- **elevation**: `double`
  The elevation for the button's [Material] when the button
 is [enabled] but not pressed.

 Defaults to 2.0. The value is always non-negative.

 See also:

  * [highlightElevation], the default elevation.
  * [hoverElevation], the elevation when a pointer is hovering over the
    button.
  * [focusElevation], the elevation when the button is focused.
  * [disabledElevation], the elevation when the button is disabled.

- **hoverElevation**: `double`
  The elevation for the button's [Material] when the button
 is [enabled] and a pointer is hovering over it.

 Defaults to 4.0. The value is always non-negative.

 If the button is [enabled], and being pressed (in the highlighted state),
 then the [highlightElevation] take precedence over the [hoverElevation].

 See also:

  * [elevation], the default elevation.
  * [focusElevation], the elevation when the button is focused.
  * [disabledElevation], the elevation when the button is disabled.
  * [highlightElevation], the elevation when the button is pressed.

- **focusElevation**: `double`
  The elevation for the button's [Material] when the button
 is [enabled] and has the input focus.

 Defaults to 4.0. The value is always non-negative.

 If the button is [enabled], and being pressed (in the highlighted state),
 or a mouse cursor is hovering over the button, then the [hoverElevation]
 and [highlightElevation] take precedence over the [focusElevation].

 See also:

  * [elevation], the default elevation.
  * [hoverElevation], the elevation when a pointer is hovering over the
    button.
  * [disabledElevation], the elevation when the button is disabled.
  * [highlightElevation], the elevation when the button is pressed.

- **highlightElevation**: `double`
  The elevation for the button's [Material] when the button
 is [enabled] and pressed.

 Defaults to 8.0. The value is always non-negative.

 See also:

  * [elevation], the default elevation.
  * [hoverElevation], the elevation when a pointer is hovering over the
    button.
  * [focusElevation], the elevation when the button is focused.
  * [disabledElevation], the elevation when the button is disabled.

- **disabledElevation**: `double`
  The elevation for the button's [Material] when the button
 is not [enabled].

 Defaults to 0.0. The value is always non-negative.

 See also:

  * [elevation], the default elevation.
  * [hoverElevation], the elevation when a pointer is hovering over the
    button.
  * [focusElevation], the elevation when the button is focused.
  * [highlightElevation], the elevation when the button is pressed.

- **padding**: `EdgeInsetsGeometry`
  The internal padding for the button's [child].

- **visualDensity**: `VisualDensity`
  Defines how compact the button's layout will be.

 

 See also:

  * [ThemeData.visualDensity], which specifies the [visualDensity] for all widgets
    within a [Theme].

- **constraints**: `BoxConstraints`
  Defines the button's size.

 Typically used to constrain the button's minimum size.

- **shape**: `ShapeBorder`
  The shape of the button's [Material].

 The button's highlight and splash are clipped to this shape. If the
 button has an elevation, then its drop shadow is defined by this shape.

 If [shape] is a [WidgetStateProperty&lt;ShapeBorder&gt;], [WidgetStateProperty.resolve]
 is used for the following [WidgetState]s:

 * [WidgetState.pressed].
 * [WidgetState.hovered].
 * [WidgetState.focused].
 * [WidgetState.disabled].

- **animationDuration**: `Duration`
  Defines the duration of animated changes for [shape] and [elevation].

 The default value is [kThemeChangeDuration].

- **child**: `Widget?`
  Typically the button's label.

- **materialTapTargetSize**: `MaterialTapTargetSize`
  Configures the minimum size of the tap target.

 Defaults to [MaterialTapTargetSize.padded].

 See also:

  * [MaterialTapTargetSize], for a description of how this affects tap targets.

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.none].

- **enableFeedback**: `bool`
  Whether detected gestures should provide acoustic and/or haptic feedback.

 For example, on Android a tap will produce a clicking sound and a
 long-press will produce a short vibration, when feedback is enabled.

 See also:

  * [Feedback] for providing platform-specific feedback to certain actions.

## Constructors

### Unnamed Constructor
Create a button based on [Semantics], [Material], and [InkWell] widgets.

 The [elevation], [focusElevation], [hoverElevation], [highlightElevation],
 and [disabledElevation] parameters must be non-negative.


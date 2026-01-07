# Overview for `IconButton`

## Description

A Material Design icon button.

 An icon button is a picture printed on a [Material] widget that reacts to
 touches by filling with color (ink).

 Icon buttons are commonly used in the [AppBar.actions] field, but they can
 be used in many other places as well.

 If the [onPressed] callback is null, then the button will be disabled and
 will not react to touch.

 Requires one of its ancestors to be a [Material] widget. In Material Design 3,
 this requirement no longer exists because this widget builds a subclass of
 [ButtonStyleButton].

 The hit region of an icon button will, if possible, be at least
 kMinInteractiveDimension pixels in size, regardless of the actual
 [iconSize], to satisfy the [touch target size](https://material.io/design/layout/spacing-methods.html#touch-targets)
 requirements in the Material Design specification. The [alignment] controls
 how the icon itself is positioned within the hit region.

 
 This sample shows an [IconButton] that uses the Material icon "volume_up" to
 increase the volume.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/icon_button.png)

 ** See code in examples/api/lib/material/icon_button/icon_button.0.dart **
 

 ### Icon sizes

 When creating an icon button with an [Icon], do not override the
 icon's size with its [Icon.size] parameter, use the icon button's
 [iconSize] parameter instead. For example do this:

 ```dart
 IconButton(
   iconSize: 72,
   icon: const Icon(Icons.favorite),
   onPressed:  ,
 ),
 ```

 Avoid doing this:

 ```dart
 IconButton(
   icon: const Icon(Icons.favorite, size: 72),
   onPressed:  ,
 ),
 ```

 If you do, the button's size will be based on the default icon
 size, not 72, which may produce unexpected layouts and clipping
 issues.

 ### Adding a filled background

 Icon buttons don't support specifying a background color or other
 background decoration because typically the icon is just displayed
 on top of the parent widget's background. Icon buttons that appear
 in [AppBar.actions] are an example of this.

 It's easy enough to create an icon button with a filled background
 using the [Ink] widget. The [Ink] widget renders a decoration on
 the underlying [Material] along with the splash and highlight
 [InkResponse] contributed by descendant widgets.

 
 In this sample the icon button's background color is defined with an [Ink]
 widget whose child is an [IconButton]. The icon button's filled background
 is a light shade of blue, it's a filled circle, and it's as big as the
 button is.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/icon_button_background.png)

 ** See code in examples/api/lib/material/icon_button/icon_button.1.dart **
 

 Material Design 3 introduced new types (standard and contained) of [IconButton]s.
 The default [IconButton] is the standard type. To create a filled icon button,
 use [IconButton.filled]; to create a filled tonal icon button, use [IconButton.filledTonal];
 to create a outlined icon button, use [IconButton.outlined].

 Material Design 3 also treats [IconButton]s as toggle buttons. In order
 to not break existing apps, the toggle feature can be optionally controlled
 by the [isSelected] property.

 If [isSelected] is null it will behave as a normal button. If [isSelected] is not
 null then it will behave as a toggle button. If [isSelected] is true then it will
 show [selectedIcon], if it false it will show the normal [icon].

 In Material Design 3, both [IconTheme] and [IconButtonTheme] are used to override the default style
 of [IconButton]. If both themes exist, the [IconButtonTheme] will override [IconTheme] no matter
 which is closer to the [IconButton]. Each [IconButton]'s property is resolved by the order of
 precedence: widget property, [IconButtonTheme] property, [IconTheme] property and
 internal default property value.

 In Material Design 3, the [IconButton.visualDensity] defaults to [VisualDensity.standard]
 for all platforms; otherwise the button will have a rounded rectangle shape if
 the [IconButton.visualDensity] is set to [VisualDensity.compact]. Users can
 customize it by using [IconButtonTheme], [IconButton.style] or [IconButton.visualDensity].

 
 This sample shows creation of [IconButton] widgets for standard, filled,
 filled tonal and outlined types, as described in: https://m3.material.io/components/icon-buttons/overview

 ** See code in examples/api/lib/material/icon_button/icon_button.2.dart **
 

 
 This sample shows creation of [IconButton] widgets with toggle feature for
 standard, filled, filled tonal and outlined types, as described
 in: https://m3.material.io/components/icon-buttons/overview

 ** See code in examples/api/lib/material/icon_button/icon_button.3.dart **
 

 See also:

  * [Icons], the library of Material Icons.
  * [BackButton], an icon button for a "back" affordance which adapts to the
    current platform's conventions.
  * [CloseButton], an icon button for closing pages.
  * [AppBar], to show a toolbar at the top of an application.
  * [TextButton], [ElevatedButton], [OutlinedButton], for buttons with text labels and an optional icon.
  * [InkResponse] and [InkWell], for the ink splash effect itself.

## Dependencies

- StatelessWidget

## Members

- **iconSize**: `double?`
  The size of the icon inside the button.

 If null, uses [IconThemeData.size]. If it is also null, the default size
 is 24.0.

 The size given here is passed down to the widget in the [icon] property
 via an [IconTheme]. Setting the size here instead of in, for example, the
 [Icon.size] property allows the [IconButton] to size the splash area to
 fit the [Icon]. If you were to set the size of the [Icon] using
 [Icon.size] instead, then the [IconButton] would default to 24.0 and then
 the [Icon] itself would likely get clipped.

 This property is only used when [icon] is or contains an [Icon] widget. It will be
 ignored if other widgets are used, such as an [Image].

 If [ThemeData.useMaterial3] is set to true and this is null, the size of the
 [IconButton] would default to 24.0. The size given here is passed down to the
 [ButtonStyle.iconSize] property.

- **visualDensity**: `VisualDensity?`
  Defines how compact the icon button's layout will be.

 

 This property can be null. If null, it defaults to [VisualDensity.standard]
 in Material Design 3 to make sure the button will be circular on all platforms.

 See also:

  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
    widgets within a [Theme].

- **padding**: `EdgeInsetsGeometry?`
  The padding around the button's icon. The entire padded icon will react
 to input gestures.

 If [ThemeData.useMaterial3] is set to false, apply padding in the square
 proportion to the button's splash/highlight shape. For example, if the
 button is a circle, use padding on all sides to center the icon inside the
 splash/highlight circle. Otherwise, wrap the [IconButton] with a [Padding]
 widget to apply padding in the desired direction.

 This property can be null. If null, it defaults to 8.0 padding on all sides.

- **alignment**: `AlignmentGeometry?`
  Defines how the icon is positioned within the IconButton.

 This property can be null. If null, it defaults to [Alignment.center].

 See also:

  * [Alignment], a class with convenient constants typically used to
    specify an [AlignmentGeometry].
  * [AlignmentDirectional], like [Alignment] for specifying alignments
    relative to text direction.

- **splashRadius**: `double?`
  The splash radius.

 If [ThemeData.useMaterial3] is set to true, this will not be used.

 If null, default splash radius of [Material.defaultSplashRadius] is used.

- **icon**: `Widget`
  The icon to display inside the button.

 The [Icon.size] and [Icon.color] of the icon is configured automatically
 based on the [iconSize] and [color] properties of _this_ widget using an
 [IconTheme] and therefore should not be explicitly given in the icon
 widget.

 See [Icon], [ImageIcon].

- **focusColor**: `Color?`
  The color for the button when it has the input focus.

 If [ThemeData.useMaterial3] is set to true, this [focusColor] will be mapped
 to be the [ButtonStyle.overlayColor] in focused state, which paints on top of
 the button, as an overlay. Therefore, using a color with some transparency
 is recommended. For example, one could customize the [focusColor] below:

 ```dart
 IconButton(
   focusColor: Colors.orange.withOpacity(0.3),
   icon: const Icon(Icons.sunny),
   onPressed:  ,
 )
 ```

 Defaults to [ThemeData.focusColor] of the ambient theme.

- **hoverColor**: `Color?`
  The color for the button when a pointer is hovering over it.

 If [ThemeData.useMaterial3] is set to true, this [hoverColor] will be mapped
 to be the [ButtonStyle.overlayColor] in hovered state, which paints on top of
 the button, as an overlay. Therefore, using a color with some transparency
 is recommended. For example, one could customize the [hoverColor] below:

 ```dart
 IconButton(
   hoverColor: Colors.orange.withOpacity(0.3),
   icon: const Icon(Icons.ac_unit),
   onPressed:  ,
 )
 ```

 Defaults to [ThemeData.hoverColor] of the ambient theme.

- **color**: `Color?`
  The color to use for the icon inside the button, if the icon is enabled.
 Defaults to leaving this up to the [icon] widget.

 The icon is enabled if [onPressed] is not null.

 ```dart
 IconButton(
   color: Colors.blue,
   icon: const Icon(Icons.sunny_snowing),
   onPressed:  ,
 )
 ```

- **splashColor**: `Color?`
  The primary color of the button when the button is in the down (pressed) state.
 The splash is represented as a circular overlay that appears above the
 [highlightColor] overlay. The splash overlay has a center point that matches
 the hit point of the user touch event. The splash overlay will expand to
 fill the button area if the touch is held for long enough time. If the splash
 color has transparency then the highlight and button color will show through.

 If [ThemeData.useMaterial3] is set to true, this will not be used. Use
 [highlightColor] instead to show the overlay color of the button when the button
 is in the pressed state.

 Defaults to the Theme's splash color, [ThemeData.splashColor].

- **highlightColor**: `Color?`
  The secondary color of the button when the button is in the down (pressed)
 state. The highlight color is represented as a solid color that is overlaid over the
 button color (if any). If the highlight color has transparency, the button color
 will show through. The highlight fades in quickly as the button is held down.

 If [ThemeData.useMaterial3] is set to true, this [highlightColor] will be mapped
 to be the [ButtonStyle.overlayColor] in pressed state, which paints on top
 of the button, as an overlay. Therefore, using a color with some transparency
 is recommended. For example, one could customize the [highlightColor] below:

 ```dart
 IconButton(
   highlightColor: Colors.orange.withOpacity(0.3),
   icon: const Icon(Icons.question_mark),
   onPressed:  ,
 )
 ```

 Defaults to the Theme's highlight color, [ThemeData.highlightColor].

- **disabledColor**: `Color?`
  The color to use for the icon inside the button, if the icon is disabled.
 Defaults to the [ThemeData.disabledColor] of the current [Theme].

 The icon is disabled if [onPressed] is null.

- **onPressed**: `VoidCallback?`
  The callback that is called when the button is tapped or otherwise activated.

 If this is set to null, the button will be disabled.

- **onHover**: `ValueChanged&lt;bool&gt;?`
  The callback that is called when the button is hovered.

- **onLongPress**: `VoidCallback?`
  The callback that is called when the button is long-pressed.

 If onPressed is set to null, the onLongPress callback is not called.

- **mouseCursor**: `MouseCursor?`
  

 If set to null, will default to
 - [SystemMouseCursors.basic], if [onPressed] is null
 - [SystemMouseCursors.click], otherwise

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **tooltip**: `String?`
  Text that describes the action that will occur when the button is pressed.

 This text is displayed when the user long-presses on the button and is
 used for accessibility.

- **enableFeedback**: `bool?`
  Whether detected gestures should provide acoustic and/or haptic feedback.

 For example, on Android a tap will produce a clicking sound and a
 long-press will produce a short vibration, when feedback is enabled.

 See also:

  * [Feedback] for providing platform-specific feedback to certain actions.

- **constraints**: `BoxConstraints?`
  Optional size constraints for the button.

 When unspecified, defaults to:
 ```dart
 const BoxConstraints(
   minWidth: kMinInteractiveDimension,
   minHeight: kMinInteractiveDimension,
 )
 ```
 where [kMinInteractiveDimension] is 48.0, and then with visual density
 applied.

 The default constraints ensure that the button is accessible.
 Specifying this parameter enables creation of buttons smaller than
 the minimum size, but it is not recommended.

 The visual density uses the [visualDensity] parameter if specified,
 and `Theme.of(context).visualDensity` otherwise.

- **style**: `ButtonStyle?`
  Customizes this button's appearance.

 Non-null properties of this style override the corresponding
 properties in [_IconButtonM3.themeStyleOf] and [_IconButtonM3.defaultStyleOf].
 [WidgetStateProperty]s that resolve to non-null values will similarly
 override the corresponding [WidgetStateProperty]s in [_IconButtonM3.themeStyleOf]
 and [_IconButtonM3.defaultStyleOf].

 The [style] is only used for Material 3 [IconButton]. If [ThemeData.useMaterial3]
 is set to true, [style] is preferred for icon button customization, and any
 parameters defined in [style] will override the same parameters in [IconButton].

 For example, if [IconButton]'s [visualDensity] is set to [VisualDensity.standard]
 and [style]'s [visualDensity] is set to [VisualDensity.compact],
 the icon button will have [VisualDensity.compact] to define the button's layout.

 Null by default.

- **isSelected**: `bool?`
  The optional selection state of the icon button.

 If this property is null, the button will behave as a normal push button,
 otherwise, the button will toggle between showing [icon] and [selectedIcon]
 based on the value of [isSelected]. If true, it will show [selectedIcon],
 if false it will show [icon].

 This property is only used if [ThemeData.useMaterial3] is true.

- **selectedIcon**: `Widget?`
  The icon to display inside the button when [isSelected] is true. This property
 can be null. The original [icon] will be used for both selected and unselected
 status if it is null.

 The [Icon.size] and [Icon.color] of the icon is configured automatically
 based on the [iconSize] and [color] properties using an [IconTheme] and
 therefore should not be explicitly configured in the icon widget.

 This property is only used if [ThemeData.useMaterial3] is true.

 See also:

 * [Icon], for icons based on glyphs from fonts instead of images.
 * [ImageIcon], for showing icons from [AssetImage]s or other [ImageProvider]s.

- **_variant**: `_IconButtonVariant`
## Constructors

### Unnamed Constructor
Creates an icon button.

 Icon buttons are commonly used in the [AppBar.actions] field, but they can
 be used in many other places as well.

 Requires one of its ancestors to be a [Material] widget. This requirement
 no longer exists if [ThemeData.useMaterial3] is set to true.

 The [icon] argument must be specified, and is typically either an [Icon]
 or an [ImageIcon].

### filled
Create a filled variant of IconButton.

 Filled icon buttons have higher visual impact and should be used for
 high emphasis actions, such as turning off a microphone or camera.

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
### filledTonal
Create a filled tonal variant of IconButton.

 Filled tonal icon buttons are a middle ground between filled and outlined
 icon buttons. They’re useful in contexts where the button requires slightly
 more emphasis than an outline would give, such as a secondary action paired
 with a high emphasis action.

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
### outlined
Create an outlined variant of IconButton.

 Outlined icon buttons are medium-emphasis buttons. They’re useful when an
 icon button needs more emphasis than a standard icon button but less than
 a filled or filled tonal icon button.

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

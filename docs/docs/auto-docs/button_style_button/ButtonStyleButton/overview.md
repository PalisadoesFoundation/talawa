# Overview for `ButtonStyleButton`

## Description

The base [StatefulWidget] class for buttons whose style is defined by a [ButtonStyle] object.

 Concrete subclasses must override [defaultStyleOf] and [themeStyleOf].

 See also:
  * [ElevatedButton], a filled button whose material elevates when pressed.
  * [FilledButton], a filled button that doesn't elevate when pressed.
  * [FilledButton.tonal], a filled button variant that uses a secondary fill color.
  * [OutlinedButton], a button with an outlined border and no fill color.
  * [TextButton], a button with no outline or fill color.
  * <https://m3.material.io/components/buttons/overview>, an overview of each of
    the Material Design button types and how they should be used in designs.

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

- **onHover**: `ValueChanged&lt;bool&gt;?`
  Called when a pointer enters or exits the button response area.

 The value passed to the callback is true if a pointer has entered this
 part of the material and false if a pointer has exited this part of the
 material.

- **onFocusChange**: `ValueChanged&lt;bool&gt;?`
  Handler called when the focus changes.

 Called with true if this widget's node gains focus, and false if it loses
 focus.

- **style**: `ButtonStyle?`
  Customizes this button's appearance.

 Non-null properties of this style override the corresponding
 properties in [themeStyleOf] and [defaultStyleOf]. [WidgetStateProperty]s
 that resolve to non-null values will similarly override the corresponding
 [WidgetStateProperty]s in [themeStyleOf] and [defaultStyleOf].

 Null by default.

- **clipBehavior**: `Clip?`
  

 Defaults to [Clip.none] unless [ButtonStyle.backgroundBuilder] or
 [ButtonStyle.foregroundBuilder] is specified. In those
 cases the default is [Clip.antiAlias].

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **statesController**: `MaterialStatesController?`
  

- **isSemanticButton**: `bool?`
  Determine whether this subtree represents a button.

 If this is null, the screen reader will not announce "button" when this
 is focused. This is useful for [MenuItemButton] and [SubmenuButton] when we
 traverse the menu system.

 Defaults to true.

- **iconAlignment**: `IconAlignment?`
  

- **tooltip**: `String?`
  Text that describes the action that will occur when the button is pressed or
 hovered over.

 This text is displayed when the user long-presses or hovers over the button
 in a tooltip. This string is also used for accessibility.

 If null, the button will not display a tooltip.

- **child**: `Widget?`
  Typically the button's label.

 

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.


# Overview for `InputChip`

## Description

A Material Design input chip.

 Input chips represent a complex piece of information, such as an entity
 (person, place, or thing) or conversational text, in a compact form.

 Input chips can be made selectable by setting [onSelected], deletable by
 setting [onDeleted], and pressable like a button with [onPressed]. They have
 a [label], and they can have a leading icon (see [avatar]) and a trailing
 icon ([deleteIcon]). Colors and padding can be customized.

 Requires one of its ancestors to be a [Material] widget.

 Input chips work together with other UI elements. They can appear:

  * In a [Wrap] widget.
  * In a horizontally scrollable list, for example configured such as a
    [ListView] with [ListView.scrollDirection] set to [Axis.horizontal].

 
 This example shows how to create [InputChip]s with [onSelected] and
 [onDeleted] callbacks. When the user taps the chip, the chip will be selected.
 When the user taps the delete icon, the chip will be deleted.

 ** See code in examples/api/lib/material/input_chip/input_chip.0.dart **
 


 
 The following example shows how to generate [InputChip]s from
 user text input. When the user enters a pizza topping in the text field,
 the user is presented with a list of suggestions. When selecting one of the
 suggestions, an [InputChip] is generated in the text field.

 ** See code in examples/api/lib/material/input_chip/input_chip.1.dart **
 

 ## Material Design 3

 [InputChip] can be used for Input chips from Material Design 3.
 If [ThemeData.useMaterial3] is true, then [InputChip]
 will be styled to match the Material Design 3 specification for Input
 chips.

 See also:

  * [Chip], a chip that displays information and can be deleted.
  * [ChoiceChip], allows a single selection from a set of options. Choice
    chips contain related descriptive text or categories.
  * [FilterChip], uses tags or descriptive words as a way to filter content.
  * [ActionChip], represents an action related to primary content.
  * [CircleAvatar], which shows images or initials of people.
  * [Wrap], A widget that displays its children in multiple horizontal or
    vertical runs.
  * <https://material.io/design/components/chips.html>

## Dependencies

- StatelessWidget, ChipAttributes, DeletableChipAttributes, SelectableChipAttributes, CheckmarkableChipAttributes, DisabledChipAttributes, TappableChipAttributes

## Members

- **avatar**: `Widget?`
- **label**: `Widget`
- **labelStyle**: `TextStyle?`
- **labelPadding**: `EdgeInsetsGeometry?`
- **selected**: `bool`
- **isEnabled**: `bool`
- **onSelected**: `ValueChanged&lt;bool&gt;?`
- **deleteIcon**: `Widget?`
- **onDeleted**: `VoidCallback?`
- **deleteIconColor**: `Color?`
- **deleteButtonTooltipMessage**: `String?`
- **onPressed**: `VoidCallback?`
- **pressElevation**: `double?`
- **disabledColor**: `Color?`
- **selectedColor**: `Color?`
- **tooltip**: `String?`
- **side**: `BorderSide?`
- **shape**: `OutlinedBorder?`
- **clipBehavior**: `Clip`
- **focusNode**: `FocusNode?`
- **autofocus**: `bool`
- **color**: `MaterialStateProperty<Color?>?`
- **backgroundColor**: `Color?`
- **padding**: `EdgeInsetsGeometry?`
- **visualDensity**: `VisualDensity?`
- **materialTapTargetSize**: `MaterialTapTargetSize?`
- **elevation**: `double?`
- **shadowColor**: `Color?`
- **surfaceTintColor**: `Color?`
- **selectedShadowColor**: `Color?`
- **showCheckmark**: `bool?`
- **checkmarkColor**: `Color?`
- **avatarBorder**: `ShapeBorder`
- **iconTheme**: `IconThemeData?`
- **avatarBoxConstraints**: `BoxConstraints?`
- **deleteIconBoxConstraints**: `BoxConstraints?`
- **chipAnimationStyle**: `ChipAnimationStyle?`
- **mouseCursor**: `MouseCursor?`
## Constructors

### Unnamed Constructor
Creates an [InputChip].

 The [onPressed] and [onSelected] callbacks must not both be specified at
 the same time. When both [onPressed] and [onSelected] are null, the chip
 will be disabled.

 The [pressElevation] and [elevation] must be null or non-negative.
 Typically, [pressElevation] is greater than [elevation].


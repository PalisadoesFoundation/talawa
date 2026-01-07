# Overview for `ChoiceChip`

## Description

A Material Design choice chip.

 [ChoiceChip]s represent a single choice from a set. Choice chips contain
 related descriptive text or categories.

 Requires one of its ancestors to be a [Material] widget.

 
 This example shows how to create [ChoiceChip]s with [onSelected]. When the
 user taps, the chip will be selected.

 ** See code in examples/api/lib/material/choice_chip/choice_chip.0.dart **
 

 ## Material Design 3

 [ChoiceChip] can be used for single select Filter chips from
 Material Design 3. If [ThemeData.useMaterial3] is true, then [ChoiceChip]
 will be styled to match the Material Design 3 specification for Filter
 chips. Use [FilterChip] for multiple select Filter chips.

 See also:

  * [Chip], a chip that displays information and can be deleted.
  * [InputChip], a chip that represents a complex piece of information, such
    as an entity (person, place, or thing) or conversational text, in a
    compact form.
  * [FilterChip], uses tags or descriptive words as a way to filter content.
  * [ActionChip], represents an action related to primary content.
  * [CircleAvatar], which shows images or initials of people.
  * [Wrap], A widget that displays its children in multiple horizontal or
    vertical runs.
  * <https://material.io/design/components/chips.html>

## Dependencies

- StatelessWidget, ChipAttributes, SelectableChipAttributes, CheckmarkableChipAttributes, DisabledChipAttributes

## Members

- **avatar**: `Widget?`
- **label**: `Widget`
- **labelStyle**: `TextStyle?`
- **labelPadding**: `EdgeInsetsGeometry?`
- **onSelected**: `ValueChanged&lt;bool&gt;?`
- **pressElevation**: `double?`
- **selected**: `bool`
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
- **chipAnimationStyle**: `ChipAnimationStyle?`
- **mouseCursor**: `MouseCursor?`
- **_chipVariant**: `_ChipVariant`
## Constructors

### Unnamed Constructor
Create a chip that acts like a radio button.

 The [label], [selected], [autofocus], and [clipBehavior] arguments must
 not be null. When [onSelected] is null, the [ChoiceChip] will be disabled.
 The [pressElevation] and [elevation] must be null or non-negative. Typically,
 [pressElevation] is greater than [elevation].

### elevated
Create an elevated chip that acts like a radio button.

 The [label], [selected], [autofocus], and [clipBehavior] arguments must
 not be null. When [onSelected] is null, the [ChoiceChip] will be disabled.
 The [pressElevation] and [elevation] must be null or non-negative. Typically,
 [pressElevation] is greater than [elevation].

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
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

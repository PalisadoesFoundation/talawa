# Overview for `FilterChip`

## Description

A Material Design filter chip.

 Filter chips use tags or descriptive words as a way to filter content.

 Filter chips are a good alternative to [Checkbox] or [Switch] widgets.
 Unlike these alternatives, filter chips allow for clearly delineated and
 exposed options in a compact area.

 Requires one of its ancestors to be a [Material] widget.

 
 This example shows how to use [FilterChip]s to filter through exercises.

 ** See code in examples/api/lib/material/filter_chip/filter_chip.0.dart **
 

 ## Material Design 3

 [FilterChip] can be used for multiple select Filter chip from
 Material Design 3. If [ThemeData.useMaterial3] is true, then [FilterChip]
 will be styled to match the Material Design 3 specification for Filter
 chips. Use [ChoiceChip] for single select Filter chips.

 See also:

  * [Chip], a chip that displays information and can be deleted.
  * [InputChip], a chip that represents a complex piece of information, such
    as an entity (person, place, or thing) or conversational text, in a
    compact form.
  * [ChoiceChip], allows a single selection from a set of options. Choice
    chips contain related descriptive text or categories.
  * [ActionChip], represents an action related to primary content.
  * [CircleAvatar], which shows images or initials of people.
  * [Wrap], A widget that displays its children in multiple horizontal or
    vertical runs.
  * <https://material.io/design/components/chips.html>

## Dependencies

- StatelessWidget, ChipAttributes, DeletableChipAttributes, SelectableChipAttributes, CheckmarkableChipAttributes, DisabledChipAttributes

## Members

- **avatar**: `Widget?`
- **label**: `Widget`
- **labelStyle**: `TextStyle?`
- **labelPadding**: `EdgeInsetsGeometry?`
- **selected**: `bool`
- **onSelected**: `ValueChanged&lt;bool&gt;?`
- **deleteIcon**: `Widget?`
- **onDeleted**: `VoidCallback?`
- **deleteIconColor**: `Color?`
- **deleteButtonTooltipMessage**: `String?`
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
- **_chipVariant**: `_ChipVariant`
## Constructors

### Unnamed Constructor
Create a chip that acts like a checkbox.

 The [selected], [label], [autofocus], and [clipBehavior] arguments must
 not be null. When [onSelected] is null, the [FilterChip] will be disabled.
 The [pressElevation] and [elevation] must be null or non-negative. Typically,
 [pressElevation] is greater than [elevation].

### elevated
Create an elevated chip that acts like a checkbox.

 The [selected], [label], [autofocus], and [clipBehavior] arguments must
 not be null. When [onSelected] is null, the [FilterChip] will be disabled.
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
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

# Overview for `ChipThemeData`

## Description

Holds the color, shape, and text styles for a Material Design chip theme.

 Use this class to configure a [ChipTheme] widget, or to set the
 [ThemeData.chipTheme] for a [Theme] widget.

 To obtain the current ambient chip theme, use [ChipTheme.of].

 The parts of a chip are:

  * The "avatar", which is a widget that appears at the beginning of the
    chip. This is typically a [CircleAvatar] widget.
  * The "label", which is the widget displayed in the center of the chip.
    Typically this is a [Text] widget.
  * The "delete icon", which is a widget that appears at the end of the chip.
  * The chip is disabled when it is not accepting user input. Only some chips
    have a disabled state: [ActionChip], [ChoiceChip], [FilterChip], and
    [InputChip].

 The simplest way to create a ChipThemeData is to use [copyWith] on the one
 you get from [ChipTheme.of], or create an entirely new one with
 [ChipThemeData.fromDefaults].

 

 ```dart
 class CarColor extends StatefulWidget 

 class _CarColorState extends State&lt;CarColor&gt; 
 ```
 

 See also:

  * [Chip], a chip that displays information and can be deleted.
  * [InputChip], a chip that represents a complex piece of information, such
    as an entity (person, place, or thing) or conversational text, in a
    compact form.
  * [ChoiceChip], allows a single selection from a set of options. Choice
    chips contain related descriptive text or categories.
  * [FilterChip], uses tags or descriptive words as a way to filter content.
  * [ActionChip], represents an action related to primary content.
  * [CircleAvatar], which shows images or initials of entities.
  * [Wrap], A widget that displays its children in multiple horizontal or
    vertical runs.
  * [ChipTheme] widget, which can override the chip theme of its
    children.
  * [Theme] widget, which performs a similar function to [ChipTheme],
    but for overall themes.
  * [ThemeData], which has a default [ChipThemeData].

## Dependencies

- Diagnosticable

## Members

- **color**: `MaterialStateProperty<Color?>?`
  Overrides the default for [ChipAttributes.color].

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **backgroundColor**: `Color?`
  Overrides the default for [ChipAttributes.backgroundColor]
 which is used for unselected, enabled chip backgrounds.

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **deleteIconColor**: `Color?`
  Overrides the default for [DeletableChipAttributes.deleteIconColor].

 This property applies to [Chip], [InputChip], [RawChip].

- **disabledColor**: `Color?`
  Overrides the default for
 [DisabledChipAttributes.disabledColor], the background color
 which indicates that the chip is not enabled.

 This property applies to [ActionChip], [ChoiceChip],
 [FilterChip], [InputChip], and [RawChip].

- **selectedColor**: `Color?`
  Overrides the default for
 [SelectableChipAttributes.selectedColor], the background color
 that indicates that the chip is selected.

 This property applies to [ChoiceChip], [FilterChip],
 [InputChip], [RawChip].

- **secondarySelectedColor**: `Color?`
  Overrides the default for [ChoiceChip.selectedColor], the
 background color that indicates that the chip is selected.

- **shadowColor**: `Color?`
  Overrides the default for [ChipAttributes.shadowColor], the
 Color of the chip's shadow when its elevation is greater than 0.

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **surfaceTintColor**: `Color?`
  Overrides the default for [ChipAttributes.surfaceTintColor], the
 Color of the chip's surface tint overlay when its elevation is
 greater than 0.

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **selectedShadowColor**: `Color?`
  Overrides the default for
 [SelectableChipAttributes.selectedShadowColor], the Color of the
 chip's shadow when its elevation is greater than 0 and the chip
 is selected.

 This property applies to [ChoiceChip], [FilterChip],
 [InputChip], [RawChip].

- **showCheckmark**: `bool?`
  Overrides the default for
 [CheckmarkableChipAttributes.showCheckmark], which indicates if
 a check mark should be shown.

 This property applies to [FilterChip], [InputChip], [RawChip].

- **checkmarkColor**: `Color?`
  Overrides the default for
 [CheckmarkableChipAttributes.checkmarkColor].

 This property applies to [FilterChip], [InputChip], [RawChip].

- **labelPadding**: `EdgeInsetsGeometry?`
  Overrides the default for [ChipAttributes.labelPadding],
 the padding around the chip's label widget.

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **padding**: `EdgeInsetsGeometry?`
  Overrides the default for [ChipAttributes.padding],
 the padding between the contents of the chip and the outside [shape].

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **side**: `BorderSide?`
  Overrides the default for [ChipAttributes.side],
 the color and weight of the chip's outline.

 This value is combined with [shape] to create a shape decorated with an
 outline. If it is a [WidgetStateBorderSide],
 [WidgetStateProperty.resolve] is used for the following
 [WidgetState]s:

  * [WidgetState.disabled].
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.pressed].

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **shape**: `OutlinedBorder?`
  Overrides the default for [ChipAttributes.shape],
 the shape of border to draw around the chip.

 This shape is combined with [side] to create a shape decorated with an
 outline. If it is a [WidgetStateOutlinedBorder],
 [WidgetStateProperty.resolve] is used for the following
 [WidgetState]s:

  * [WidgetState.disabled].
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.pressed].

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **labelStyle**: `TextStyle?`
  Overrides the default for [ChipAttributes.labelStyle],
 the style of the [DefaultTextStyle] that contains the
 chip's label.

 This only has an effect on label widgets that respect the
 [DefaultTextStyle], such as [Text].

 This property applies to [ActionChip], [Chip],
 [FilterChip], [InputChip], [RawChip].

- **secondaryLabelStyle**: `TextStyle?`
  Overrides the default for [ChoiceChip.labelStyle],
 the style of the [DefaultTextStyle] that contains the
 chip's label.

 This only has an effect on label widgets that respect the
 [DefaultTextStyle], such as [Text].

- **brightness**: `Brightness?`
  Overrides the default value for all chips which affects various base
 material color choices in the chip rendering.

- **elevation**: `double?`
  Overrides the default for [ChipAttributes.elevation],
 the elevation of the chip's [Material].

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **pressElevation**: `double?`
  Overrides the default for [TappableChipAttributes.pressElevation],
 the elevation of the chip's [Material] during a "press" or tap down.

 This property applies to [ActionChip], [InputChip], [RawChip].

- **iconTheme**: `IconThemeData?`
  Overrides the default for [ChipAttributes.iconTheme],
 the theme used for all icons in the chip.

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **avatarBoxConstraints**: `BoxConstraints?`
  Overrides the default for [ChipAttributes.avatarBoxConstraints],
 the size constraints for the avatar widget.

 This property applies to [ActionChip], [Chip], [ChoiceChip],
 [FilterChip], [InputChip], [RawChip].

- **deleteIconBoxConstraints**: `BoxConstraints?`
  Overrides the default for [DeletableChipAttributes.deleteIconBoxConstraints].
 the size constraints for the delete icon widget.

 This property applies to [Chip], [FilterChip], [InputChip], [RawChip].

## Constructors

### Unnamed Constructor
Create a [ChipThemeData] given a set of exact values. All the values
 must be specified except for [shadowColor], [selectedShadowColor],
 [elevation], and [pressElevation], which may be null.

 This will rarely be used directly. It is used by [lerp] to
 create intermediate themes based on two themes.

### fromDefaults
Generates a ChipThemeData from a brightness, a primary color, and a text
 style.

 The [brightness] is used to select a primary color from the default
 values.

 The optional [primaryColor] is used as the base color for the other
 colors. The opacity of the [primaryColor] is ignored. If a [primaryColor]
 is specified, then the [brightness] is ignored, and the theme brightness
 is determined from the [primaryColor].

 Only one of [primaryColor] or [brightness] may be specified.

 The [secondaryColor] is used for the selection colors needed by
 [ChoiceChip].

 This is used to generate the default chip theme for a [ThemeData].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

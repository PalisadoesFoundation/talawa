# Overview for `ActionChip`

## Description

A Material Design action chip.

 Action chips are a set of options which trigger an action related to primary
 content. Action chips should appear dynamically and contextually in a UI.

 Action chips can be tapped to trigger an action or show progress and
 confirmation. For Material 3, a disabled state is supported for Action
 chips and is specified with [onPressed] being null. For previous versions
 of Material Design, it is recommended to remove the Action chip from
 the interface entirely rather than display a disabled chip.

 Action chips are displayed after primary content, such as below a card or
 persistently at the bottom of a screen.

 The material button widgets, [ElevatedButton], [TextButton], and
 [OutlinedButton], are an alternative to action chips, which should appear
 statically and consistently in a UI.

 Requires one of its ancestors to be a [Material] widget.

 
 This example shows how to create an [ActionChip] with a leading icon.
 The icon is updated when the [ActionChip] is pressed.

 ** See code in examples/api/lib/material/action_chip/action_chip.0.dart **
 

 ## Material Design 3

 [ActionChip] can be used for both the Assist and Suggestion chips from
 Material Design 3. If [ThemeData.useMaterial3] is true, then [ActionChip]
 will be styled to match the Material Design 3 Assist and Suggestion chips.

 ### Creating an Assist chip

 Assist chips are used to provide a quick way to perform an action.
 To create an Action chip, set the icon property to the icon
 that represents the action and set the label to the name of the action.


 ### Creating a Suggestion chip

 Suggestion chips usually display generated suggestions for the user,
 like a suggested response to a message.

 To create a Suggestion chip, set the label to the suggestion
 and don't set the icon property.

 See also:

  * [Chip], a chip that displays information and can be deleted.
  * [InputChip], a chip that represents a complex piece of information, such
    as an entity (person, place, or thing) or conversational text, in a
    compact form.
  * [ChoiceChip], allows a single selection from a set of options. Choice
    chips contain related descriptive text or categories.
  * [CircleAvatar], which shows images or initials of people.
  * [Wrap], A widget that displays its children in multiple horizontal or
    vertical runs.
  * <https://material.io/design/components/chips.html>

## Dependencies

- StatelessWidget, ChipAttributes, TappableChipAttributes, DisabledChipAttributes

## Members

- **avatar**: `Widget?`
- **label**: `Widget`
- **labelStyle**: `TextStyle?`
- **labelPadding**: `EdgeInsetsGeometry?`
- **onPressed**: `VoidCallback?`
- **pressElevation**: `double?`
- **tooltip**: `String?`
- **side**: `BorderSide?`
- **shape**: `OutlinedBorder?`
- **clipBehavior**: `Clip`
- **focusNode**: `FocusNode?`
- **autofocus**: `bool`
- **color**: `MaterialStateProperty<Color?>?`
- **backgroundColor**: `Color?`
- **disabledColor**: `Color?`
- **padding**: `EdgeInsetsGeometry?`
- **visualDensity**: `VisualDensity?`
- **materialTapTargetSize**: `MaterialTapTargetSize?`
- **elevation**: `double?`
- **shadowColor**: `Color?`
- **surfaceTintColor**: `Color?`
- **iconTheme**: `IconThemeData?`
- **avatarBoxConstraints**: `BoxConstraints?`
- **chipAnimationStyle**: `ChipAnimationStyle?`
- **mouseCursor**: `MouseCursor?`
- **_chipVariant**: `_ChipVariant`
## Constructors

### Unnamed Constructor
Create a chip that acts like a button.

 The [label], [autofocus], and [clipBehavior] arguments must not be null.
 When [onPressed] is null, the [ActionChip] will be disabled. The [pressElevation]
 and [elevation] must be null or non-negative. Typically, [pressElevation]
 is greater than [elevation].

### elevated
Create an elevated chip that acts like a button.

 The [label], [autofocus], and [clipBehavior] arguments must not be null.
 When [onPressed] is null, the [ActionChip] will be disabled. The [pressElevation]
 and [elevation] must be null or non-negative. Typically, [pressElevation]
 is greater than [elevation].

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

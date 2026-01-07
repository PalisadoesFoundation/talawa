# Overview for `RawAutocomplete`

## Description


 A widget for helping the user make a selection by entering some text and
 choosing from among a list of options.

 The user's text input is received in a field built with the
 [fieldViewBuilder] parameter. The options to be displayed are determined
 using [optionsBuilder] and rendered with [optionsViewBuilder].
 

 This is a core framework widget with very basic UI.

 
 This example shows how to create a very basic autocomplete widget using the
 [fieldViewBuilder] and [optionsViewBuilder] parameters.

 ** See code in examples/api/lib/widgets/autocomplete/raw_autocomplete.0.dart **
 

 The type parameter T represents the type of the options. Most commonly this
 is a String, as in the example above. However, it's also possible to use
 another type with a `toString` method, or a custom [displayStringForOption].
 Options will be compared using `==`, so it may be beneficial to override
 [Object.==] and [Object.hashCode] for custom types.

 
 This example is similar to the previous example, but it uses a custom T data
 type instead of directly using String.

 ** See code in examples/api/lib/widgets/autocomplete/raw_autocomplete.1.dart **
 

 
 This example shows the use of RawAutocomplete in a form.

 ** See code in examples/api/lib/widgets/autocomplete/raw_autocomplete.2.dart **
 

 See also:

  * [Autocomplete], which is a Material-styled implementation that is based
 on RawAutocomplete.

## Dependencies

- StatefulWidget

## Members

- **fieldViewBuilder**: `AutocompleteFieldViewBuilder?`
  
 Builds the field whose input is used to get the options.

 Pass the provided [TextEditingController] to the field built here so that
 RawAutocomplete can listen for changes.
 

 If this parameter is null, then a [SizedBox.shrink] is built instead.
 For how that pattern can be useful, see [textEditingController].

- **focusNode**: `FocusNode?`
  The [FocusNode] that is used for the text field.

 
 The main purpose of this parameter is to allow the use of a separate text
 field located in another part of the widget tree instead of the text
 field built by [fieldViewBuilder]. For example, it may be desirable to
 place the text field in the AppBar and the options below in the main body.

 When following this pattern, [fieldViewBuilder] can be omitted,
 so that a text field is not drawn where it would normally be.
 A separate text field can be created elsewhere, and a
 FocusNode and TextEditingController can be passed both to that text field
 and to RawAutocomplete.

 
 This examples shows how to create an autocomplete widget with the text
 field in the AppBar and the results in the main body of the app.

 ** See code in examples/api/lib/widgets/autocomplete/raw_autocomplete.focus_node.0.dart **
 
 

 If this parameter is not null, then [textEditingController] must also be
 not null.

- **optionsViewBuilder**: `AutocompleteOptionsViewBuilder&lt;T&gt;`
  
 Builds the selectable options widgets from a list of options objects.

 The options are displayed floating below or above the field inside of an
 [Overlay], not at the same place in the widget tree as [RawAutocomplete].
 To control whether it opens upward or downward, use
 [optionsViewOpenDirection].

 In order to track which item is highlighted by keyboard navigation, the
 resulting options will be wrapped in an inherited
 [AutocompleteHighlightedOption] widget.
 Inside this callback, the index of the highlighted option can be obtained
 from [AutocompleteHighlightedOption.of] to display the highlighted option
 with a visual highlight to indicate it will be the option selected from
 the keyboard.

 

- **optionsViewOpenDirection**: `OptionsViewOpenDirection`
  
 The direction in which to open the options-view overlay.

 Defaults to [OptionsViewOpenDirection.down].
 

- **displayStringForOption**: `AutocompleteOptionToString&lt;T&gt;`
  
 Returns the string to display in the field when the option is selected.

 This is useful when using a custom T type and the string to display is
 different than the string to search by.

 If not provided, will use `option.`.
 

- **onSelected**: `AutocompleteOnSelected&lt;T&gt;?`
  
 Called when an option is selected by the user.
 

- **optionsBuilder**: `AutocompleteOptionsBuilder&lt;T&gt;`
  
 A function that returns the current selectable options objects given the
 current TextEditingValue.
 

- **textEditingController**: `TextEditingController?`
  The [TextEditingController] that is used for the text field.

 

 If this parameter is not null, then [focusNode] must also be not null.

- **initialValue**: `TextEditingValue?`
  
 The initial value to use for the text field.
 

 Setting the initial value does not notify [textEditingController]'s
 listeners, and thus will not cause the options UI to appear.

 This parameter is ignored if [textEditingController] is defined.

## Constructors

### Unnamed Constructor
Create an instance of RawAutocomplete.

 [displayStringForOption], [optionsBuilder] and [optionsViewBuilder] must
 not be null.


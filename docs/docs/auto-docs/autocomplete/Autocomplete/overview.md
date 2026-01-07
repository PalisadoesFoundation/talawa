# Overview for `Autocomplete`

## Description



 

 
 This example shows how to create a very basic Autocomplete widget using the
 default UI.

 ** See code in examples/api/lib/material/autocomplete/autocomplete.0.dart **
 

 
 This example shows how to create an Autocomplete widget with a custom type.
 Try searching with text from the name or email field.

 ** See code in examples/api/lib/material/autocomplete/autocomplete.1.dart **
 

 
 This example shows how to create an Autocomplete widget whose options are
 fetched over the network.

 ** See code in examples/api/lib/material/autocomplete/autocomplete.2.dart **
 

 
 This example shows how to create an Autocomplete widget whose options are
 fetched over the network. It uses debouncing to wait to perform the network
 request until after the user finishes typing.

 ** See code in examples/api/lib/material/autocomplete/autocomplete.3.dart **
 

 
 This example shows how to create an Autocomplete widget whose options are
 fetched over the network. It includes both debouncing and error handling, so
 that failed network requests show an error to the user and can be recovered
 from. Try toggling the network Switch widget to simulate going offline.

 ** See code in examples/api/lib/material/autocomplete/autocomplete.4.dart **
 

 See also:

  * [RawAutocomplete], which is what Autocomplete is built upon, and which
    contains more detailed examples.

## Dependencies

- StatelessWidget

## Members

- **displayStringForOption**: `AutocompleteOptionToString&lt;T&gt;`
  

- **fieldViewBuilder**: `AutocompleteFieldViewBuilder`
  

 If not provided, will build a standard Material-style text field by
 default.

- **onSelected**: `AutocompleteOnSelected&lt;T&gt;?`
  

- **optionsBuilder**: `AutocompleteOptionsBuilder&lt;T&gt;`
  

- **optionsViewBuilder**: `AutocompleteOptionsViewBuilder&lt;T&gt;?`
  

 If not provided, will build a standard Material-style list of results by
 default.

- **optionsViewOpenDirection**: `OptionsViewOpenDirection`
  

- **optionsMaxHeight**: `double`
  The maximum height used for the default Material options list widget.

 When [optionsViewBuilder] is `null`, this property sets the maximum height
 that the options widget can occupy.

 The default value is set to 200.

- **initialValue**: `TextEditingValue?`
  

## Constructors

### Unnamed Constructor
Creates an instance of [Autocomplete].


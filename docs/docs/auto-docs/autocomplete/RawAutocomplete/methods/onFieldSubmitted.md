# Method: `onFieldSubmitted`

## Description

Calls [AutocompleteFieldViewBuilder]'s onFieldSubmitted callback for the
 RawAutocomplete widget indicated by the given [GlobalKey].

 This is not typically used unless a custom field is implemented instead of
 using [fieldViewBuilder]. In the typical case, the onFieldSubmitted
 callback is passed via the [AutocompleteFieldViewBuilder] signature. When
 not using fieldViewBuilder, the same callback can be called by using this
 static method.

 See also:

  * [focusNode] and [textEditingController], which contain a code example
    showing how to create a separate field outside of fieldViewBuilder.

## Return Type
`void`

## Parameters

- `key`: `GlobalKey`

# Method: `maybeOf`

## Description

Returns the [AutofillGroupState] of the closest [AutofillGroup] widget
 which encloses the given context, or null if one cannot be found.

 Calling this method will create a dependency on the closest
 [AutofillGroup] in the [context], if there is one.

 

 See also:

 * [AutofillGroup.of], which is similar to this method, but asserts if an
   [AutofillGroup] cannot be found.
 * [EditableTextState], where this method is used to retrieve the closest
   [AutofillGroupState].

## Return Type
`AutofillGroupState?`

## Parameters

- `context`: `BuildContext`

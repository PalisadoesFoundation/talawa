# Method: `of`

## Description

Returns the [AutofillGroupState] of the closest [AutofillGroup] widget
 which encloses the given context.

 If no instance is found, this method will assert in debug mode and throw
 an exception in release mode.

 Calling this method will create a dependency on the closest
 [AutofillGroup] in the [context].

 

 See also:

 * [AutofillGroup.maybeOf], which is similar to this method, but returns
   null if an [AutofillGroup] cannot be found.
 * [EditableTextState], where this method is used to retrieve the closest
   [AutofillGroupState].

## Return Type
`AutofillGroupState`

## Parameters

- `context`: `BuildContext`

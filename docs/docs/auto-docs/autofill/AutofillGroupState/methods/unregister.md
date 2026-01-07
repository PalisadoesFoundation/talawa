# Method: `unregister`

## Description

Removes an [AutofillClient] with the given `autofillId` from this
 [AutofillGroup].

 Typically, this should be called by a text field when it's being disposed,
 or before it's registered with a different [AutofillGroup].

 See also:

 * [EditableTextState.didChangeDependencies], where this method is called
   to unregister from the previous [AutofillScope].
 * [EditableTextState.dispose], where this method is called to unregister
   from the current [AutofillScope] when the widget is about to be removed
   from the tree.

## Return Type
`void`

## Parameters

- `autofillId`: `String`

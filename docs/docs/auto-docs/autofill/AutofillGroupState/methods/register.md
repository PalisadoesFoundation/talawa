# Method: `register`

## Description

Adds the [AutofillClient] to this [AutofillGroup].

 Typically, this is called by [TextInputClient]s that support autofill (for
 example, [EditableTextState]) in [State.didChangeDependencies], when the
 input field should be registered to a new [AutofillGroup].

 See also:

 * [EditableTextState.didChangeDependencies], where this method is called
   to update the current [AutofillScope] when needed.

## Return Type
`void`

## Parameters

- `client`: `AutofillClient`

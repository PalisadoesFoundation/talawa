# Method: `inState`

## Description

Returns a snapshot like this one, but in the specified [state].

 The [data], [error], and [stackTrace] fields persist unmodified, even if
 the new state is [ConnectionState.none].

## Return Type
`AsyncSnapshot&lt;T&gt;`

## Parameters

- `state`: `ConnectionState`

# Method: `interpolateSkeleton`

## Description

Interpolates the [injections] into an HTML skeleton file.

 The order of the injections is important.

 Takes into account the [type] and doesn't substitute in the id and the app
 if not a [SnippetType.sample] snippet.

## Return Type
`String`

## Parameters

- `sample`: `CodeSample`
- `skeleton`: `String`

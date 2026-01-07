# Method: `resolveIdentifier`

## Description

Returns an [Identifier] for a top level [name] in [library].

 You should only do this for libraries that are definitely in the
 transitive import graph of the library you are generating code into. If
 [library] is not in this transitive import graph, then an unspecified
 [Exception] should be thrown. The best way to ensure this, is to have the
 macro library itself import [library] (even if it doesn't directly use
 it).

 When the name alone is not sufficient to disambiguate between multiple
 declarations, such as the case of a field (which has a synthetic getter),
 an [Identifier] pointing to the non-synthetic declaration will be
 returned. Future calls to `declarationOf(identifier)` will return that
 non-synthetic declaration.

 If [name] does not exist in [library], then an unspecified [Exception]
 should be thrown.

## Return Type
`Future&lt;Identifier&gt;`

## Parameters

- `library`: `Uri`
- `name`: `String`

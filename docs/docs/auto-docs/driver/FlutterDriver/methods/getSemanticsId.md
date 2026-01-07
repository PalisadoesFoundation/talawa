# Method: `getSemanticsId`

## Description

Retrieves the semantics node id for the object returned by `finder`, or
 the nearest ancestor with a semantics node.

 Throws an error if `finder` returns multiple elements or a semantics
 node is not found.

 Semantics must be enabled to use this method, either using a platform
 specific shell command or [setSemantics].

## Return Type
`Future&lt;int&gt;`

## Parameters

- `finder`: `SerializableFinder`
- ``: `dynamic`

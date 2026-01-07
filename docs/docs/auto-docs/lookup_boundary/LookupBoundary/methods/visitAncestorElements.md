# Method: `visitAncestorElements`

## Description

Walks the ancestor chain, starting with the parent of the build context's
 widget, invoking the argument for each ancestor until a [LookupBoundary]
 or the root is reached.

 This method behaves exactly like [BuildContext.visitAncestorElements],
 except it only walks the tree up to the closest [LookupBoundary] ancestor
 of the provided context. The root of the tree is treated as an implicit
 lookup boundary.

 

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `visitor`: `ConditionalElementVisitor`

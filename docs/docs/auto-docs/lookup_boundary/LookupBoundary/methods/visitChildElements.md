# Method: `visitChildElements`

## Description

Walks the non-[LookupBoundary] child [Element]s of the provided
 `context`.

 This method behaves exactly like [BuildContext.visitChildElements],
 except it only visits children that are not a [LookupBoundary].

 

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `visitor`: `ElementVisitor`

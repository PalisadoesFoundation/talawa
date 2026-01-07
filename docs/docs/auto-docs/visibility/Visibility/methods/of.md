# Method: `of`

## Description

Tells the visibility state of an element in the tree based off its
 ancestor [Visibility] elements.

 If there's one or more [Visibility] widgets in the ancestor tree, this
 will return true if and only if all of those widgets have [visible] set
 to true. If there is no [Visibility] widget in the ancestor tree of the
 specified build context, this will return true.

 This will register a dependency from the specified context on any
 [Visibility] elements in the ancestor tree, such that if any of their
 visibilities changes, the specified context will be rebuilt.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`

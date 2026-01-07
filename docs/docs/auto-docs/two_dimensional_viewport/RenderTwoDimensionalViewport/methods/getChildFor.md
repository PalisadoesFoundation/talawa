# Method: `getChildFor`

## Description

Returns the active child located at the provided [ChildVicinity], if there
 is one.

 This can be used by subclasses to access currently active children to make
 use of their size or [TwoDimensionalViewportParentData], such as when
 overriding the [paint] method.

 Returns null if there is no active child for the given [ChildVicinity].

## Return Type
`RenderBox?`

## Parameters

- `vicinity`: `ChildVicinity`

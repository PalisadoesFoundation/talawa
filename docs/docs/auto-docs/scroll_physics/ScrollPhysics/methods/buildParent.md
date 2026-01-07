# Method: `buildParent`

## Description

If [parent] is null then return ancestor, otherwise recursively build a
 ScrollPhysics that has [ancestor] as its parent.

 This method is typically used to define [applyTo] methods like:

 ```dart
 class MyScrollPhysics extends ScrollPhysics 
 ```

## Return Type
`ScrollPhysics?`

## Parameters

- `ancestor`: `ScrollPhysics?`

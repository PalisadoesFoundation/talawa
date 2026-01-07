# Method: `preferredSize`

## Description

The size this widget would prefer if it were otherwise unconstrained.

 In many cases it's only necessary to define one preferred dimension.
 For example the [Scaffold] only depends on its app bar's preferred
 height. In that case implementations of this method can just return
 `Size.fromHeight(myAppBarHeight)`.

## Return Type
`Size`


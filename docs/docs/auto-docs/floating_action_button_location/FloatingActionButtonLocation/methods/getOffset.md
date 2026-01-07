# Method: `getOffset`

## Description

Places the [FloatingActionButton] based on the [Scaffold]'s layout.

 This uses a [ScaffoldPrelayoutGeometry], which the [Scaffold] constructs
 during its layout phase after it has laid out every widget it can lay out
 except the [FloatingActionButton]. The [Scaffold] uses the [Offset]
 returned from this method to position the [FloatingActionButton] and
 complete its layout.

## Return Type
`Offset`

## Parameters

- `scaffoldGeometry`: `ScaffoldPrelayoutGeometry`

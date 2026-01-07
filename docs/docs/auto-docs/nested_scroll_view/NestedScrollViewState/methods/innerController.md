# Method: `innerController`

## Description

The [ScrollController] provided to the [ScrollView] in
 [NestedScrollView.body].

 Manipulating the [ScrollPosition] of this controller pushes the outer
 header sliver(s) up and out of view. The position of the [outerController]
 will be set to [ScrollPosition.maxScrollExtent], unless you use
 [ScrollPosition.setPixels].

 See also:

  * [outerController], which exposes the [ScrollController] used by the
    sliver(s) contained in [NestedScrollView.headerSliverBuilder].

## Return Type
`ScrollController`


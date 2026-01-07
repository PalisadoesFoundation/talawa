# Method: `outerController`

## Description

The [ScrollController] provided to the [ScrollView] in
 [NestedScrollView.headerSliverBuilder].

 This is equivalent to [NestedScrollView.controller], if provided.

 Manipulating the [ScrollPosition] of this controller pushes the inner body
 sliver(s) down. The position of the [innerController] will be set to
 [ScrollPosition.minScrollExtent], unless you use
 [ScrollPosition.setPixels]. Visually, the inner body will be scrolled to
 its beginning.

 See also:

  * [innerController], which exposes the [ScrollController] used by the
    [ScrollView] contained in [NestedScrollView.body].

## Return Type
`ScrollController`


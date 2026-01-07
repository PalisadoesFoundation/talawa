# Overview for `DisplayFeatureSubScreen`

## Description

Positions [child] such that it avoids overlapping any [DisplayFeature] that
 splits the screen into sub-screens.

 A [DisplayFeature] splits the screen into sub-screens when both these
 conditions are met:

   * it obstructs the screen, meaning the area it occupies is not 0 or the
     `state` is [DisplayFeatureState.postureHalfOpened].
   * it is at least as tall as the screen, producing a left and right
     sub-screen or it is at least as wide as the screen, producing a top and
     bottom sub-screen

 After determining the sub-screens, the closest one to [anchorPoint] is used
 to render the content.

 If no [anchorPoint] is provided, then [Directionality] is used:

   * for [TextDirection.ltr], [anchorPoint] is `Offset.zero`, which will
     cause the content to appear in the top-left sub-screen.
   * for [TextDirection.rtl], [anchorPoint] is `Offset(double.maxFinite, 0)`,
     which will cause the content to appear in the top-right sub-screen.

 If no [anchorPoint] is provided, and there is no [Directionality] ancestor
 widget in the tree, then the widget asserts during build in debug mode.

 Similarly to [SafeArea], this widget assumes there is no added padding
 between it and the first [MediaQuery] ancestor. The [child] is wrapped in a
 new [MediaQuery] instance containing the [DisplayFeature]s that exist in the
 selected sub-screen, with coordinates relative to the sub-screen. Padding is
 also adjusted to zero out any sides that were avoided by this widget.

 See also:

  * [showDialog], which is a way to display a [DialogRoute].
  * [showCupertinoDialog], which displays an iOS-style dialog.

## Dependencies

- StatelessWidget

## Members

- **anchorPoint**: `Offset?`
  
 The anchor point used to pick the closest sub-screen.

 If the anchor point sits inside one of these sub-screens, then that
 sub-screen is picked. If not, then the sub-screen with the closest edge to
 the point is used.

 [Offset.zero] is the top-left corner of the available screen space. For a
 vertically split dual-screen device, this is the top-left corner of the
 left screen.

 When this is null, [Directionality] is used:

   * for [TextDirection.ltr], [anchorPoint] is [Offset.zero], which will
     cause the top-left sub-screen to be picked.
   * for [TextDirection.rtl], [anchorPoint] is
     `Offset(double.maxFinite, 0)`, which will cause the top-right
     sub-screen to be picked.
 

- **child**: `Widget`
  The widget below this widget in the tree.

 The padding on the [MediaQuery] for the [child] will be suitably adjusted
 to zero out any sides that were avoided by this widget. The [MediaQuery]
 for the [child] will no longer contain any display features that split the
 screen into sub-screens.

 

## Constructors

### Unnamed Constructor
Creates a widget that positions its child so that it avoids display
 features.


# Overview for `FlexibleSpaceBar`

## Description

The part of a Material Design [AppBar] that expands, collapses, and
 stretches.

 

 Most commonly used in the [SliverAppBar.flexibleSpace] field, a flexible
 space bar expands and contracts as the app scrolls so that the [AppBar]
 reaches from the top of the app to the top of the scrolling contents of the
 app. When using [SliverAppBar.flexibleSpace], the [SliverAppBar.expandedHeight]
 must be large enough to accommodate the [SliverAppBar.flexibleSpace] widget.

 Furthermore is included functionality for stretch behavior. When
 [SliverAppBar.stretch] is true, and your [ScrollPhysics] allow for
 overscroll, this space will stretch with the overscroll.

 The widget that sizes the [AppBar] must wrap it in the widget returned by
 [FlexibleSpaceBar.createSettings], to convey sizing information down to the
 [FlexibleSpaceBar].

 
 This sample application demonstrates the different features of the
 [FlexibleSpaceBar] when used in a [SliverAppBar]. This app bar is configured
 to stretch into the overscroll space, and uses the
 [FlexibleSpaceBar.stretchModes] to apply `fadeTitle`, `blurBackground` and
 `zoomBackground`. The app bar also makes use of [CollapseMode.parallax] by
 default.

 ** See code in examples/api/lib/material/flexible_space_bar/flexible_space_bar.0.dart **
 

 See also:

  * [SliverAppBar], which implements the expanding and contracting.
  * [AppBar], which is used by [SliverAppBar].
  * <https://material.io/design/components/app-bars-top.html#behavior>

## Dependencies

- StatefulWidget

## Members

- **title**: `Widget?`
  The primary contents of the flexible space bar when expanded.

 Typically a [Text] widget.

- **background**: `Widget?`
  Shown behind the [title] when expanded.

 Typically an [Image] widget with [Image.fit] set to [BoxFit.cover].

- **centerTitle**: `bool?`
  Whether the title should be centered.

 If the length of the title is greater than the available space, set
 this property to false. This aligns the title to the start of the
 flexible space bar and applies [titlePadding] to the title.

 By default this property is true if the current target platform
 is [TargetPlatform.iOS] or [TargetPlatform.macOS], false otherwise.

- **collapseMode**: `CollapseMode`
  Collapse effect while scrolling.

 Defaults to [CollapseMode.parallax].

- **stretchModes**: `List&lt;StretchMode&gt;`
  Stretch effect while over-scrolling.

 Defaults to include [StretchMode.zoomBackground].

- **titlePadding**: `EdgeInsetsGeometry?`
  Defines how far the [title] is inset from either the widget's
 bottom-left or its center.

 Typically this property is used to adjust how far the title is
 inset from the bottom-left and it is specified along with
 [centerTitle] false.

 If [centerTitle] is true, then the title is centered within the
 flexible space bar with a bottom padding of 16.0 pixels.

 If [centerTitle] is false and [FlexibleSpaceBarSettings.hasLeading] is true,
 then the title is aligned to the start of the flexible space bar with the
 [titlePadding] applied. If [titlePadding] is null, then defaults to start
 padding of 72.0 pixels and bottom padding of 16.0 pixels.

- **expandedTitleScale**: `double`
  Defines how much the title is scaled when the FlexibleSpaceBar is expanded
 due to the user scrolling downwards. The title is scaled uniformly on the
 x and y axes while maintaining its bottom-left position (bottom-center if
 [centerTitle] is true).

 Defaults to 1.5 and must be greater than 1.

## Constructors

### Unnamed Constructor
Creates a flexible space bar.

 Most commonly used in the [AppBar.flexibleSpace] field.


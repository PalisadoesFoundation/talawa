# Overview for `MaterialScrollBehavior`

## Description

Describes how [Scrollable] widgets behave for [MaterialApp]s.

 

 Setting a [MaterialScrollBehavior] will apply a
 [GlowingOverscrollIndicator] to [Scrollable] descendants when executing on
 [TargetPlatform.android] and [TargetPlatform.fuchsia].

 When using the desktop platform, if the [Scrollable] widget scrolls in the
 [Axis.vertical], a [Scrollbar] is applied.

 If the scroll direction is [Axis.horizontal] scroll views are less
 discoverable, so consider adding a Scrollbar in these cases, either directly
 or through the [buildScrollbar] method.

 [ThemeData.useMaterial3] specifies the
 overscroll indicator that is used on [TargetPlatform.android], which
 defaults to true, resulting in a [StretchingOverscrollIndicator]. Setting
 [ThemeData.useMaterial3] to false will instead use a
 [GlowingOverscrollIndicator].

 See also:

  * [ScrollBehavior], the default scrolling behavior extended by this class.

## Dependencies

- ScrollBehavior

## Constructors

### Unnamed Constructor
Creates a MaterialScrollBehavior that decorates [Scrollable]s with
 [StretchingOverscrollIndicator]s and [Scrollbar]s based on the current
 platform and provided [ScrollableDetails].

 [ThemeData.useMaterial3] specifies the
 overscroll indicator that is used on [TargetPlatform.android], which
 defaults to true, resulting in a [StretchingOverscrollIndicator]. Setting
 [ThemeData.useMaterial3] to false will instead use a
 [GlowingOverscrollIndicator].


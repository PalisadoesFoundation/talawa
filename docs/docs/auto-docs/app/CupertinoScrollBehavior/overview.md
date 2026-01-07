# Overview for `CupertinoScrollBehavior`

## Description

Describes how [Scrollable] widgets behave for [CupertinoApp]s.

 

 Setting a [CupertinoScrollBehavior] will result in descendant [Scrollable] widgets
 using [BouncingScrollPhysics] by default. No [GlowingOverscrollIndicator] is
 applied when using a [CupertinoScrollBehavior] either, regardless of platform.
 When executing on desktop platforms, a [CupertinoScrollbar] is applied to the child.

 See also:

  * [ScrollBehavior], the default scrolling behavior extended by this class.

## Dependencies

- ScrollBehavior

## Constructors

### Unnamed Constructor
Creates a CupertinoScrollBehavior that uses [BouncingScrollPhysics] and
 adds [CupertinoScrollbar]s on desktop platforms.


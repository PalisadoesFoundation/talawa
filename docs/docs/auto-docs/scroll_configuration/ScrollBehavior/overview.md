# Overview for `ScrollBehavior`

## Description

Describes how [Scrollable] widgets should behave.

 
 Used by [ScrollConfiguration] to configure the [Scrollable] widgets in a
 subtree.

 This class can be extended to further customize a [ScrollBehavior] for a
 subtree. For example, overriding [ScrollBehavior.getScrollPhysics] sets the
 default [ScrollPhysics] for [Scrollable]s that inherit this [ScrollConfiguration].
 Overriding [ScrollBehavior.buildOverscrollIndicator] can be used to add or change
 the default [GlowingOverscrollIndicator] decoration, while
 [ScrollBehavior.buildScrollbar] can be changed to modify the default [Scrollbar].

 When looking to easily toggle the default decorations, you can use
 [ScrollBehavior.copyWith] instead of creating your own [ScrollBehavior] class.
 The `scrollbar` and `overscrollIndicator` flags can turn these decorations off.
 

 See also:

   * [ScrollConfiguration], the inherited widget that controls how
     [Scrollable] widgets behave in a subtree.

## Members

- **_bouncingPhysics**: `ScrollPhysics`
- **_bouncingDesktopPhysics**: `ScrollPhysics`
- **_clampingPhysics**: `ScrollPhysics`
## Constructors

### Unnamed Constructor
Creates a description of how [Scrollable] widgets should behave.


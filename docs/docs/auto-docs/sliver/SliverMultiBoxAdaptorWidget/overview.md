# Overview for `SliverMultiBoxAdaptorWidget`

## Description

A base class for slivers that have multiple box children.

 Helps subclasses build their children lazily using a [SliverChildDelegate].

 The widgets returned by the [delegate] are cached and the delegate is only
 consulted again if it changes and the new delegate's
 [SliverChildDelegate.shouldRebuild] method returns true.

## Dependencies

- SliverWithKeepAliveWidget

## Members

- **delegate**: `SliverChildDelegate`
  
 The delegate that provides the children for this widget.

 The children are constructed lazily using this delegate to avoid creating
 more children than are visible through the [Viewport].

 ## Using more than one delegate in a [Viewport]

 If multiple delegates are used in a single scroll view, the first child of
 each delegate will always be laid out, even if it extends beyond the
 currently viewable area. This is because at least one child is required in
 order to estimate the max scroll offset for the whole scroll view, as it
 uses the currently built children to estimate the remaining children's
 extent.

 See also:

  * [SliverChildBuilderDelegate] and [SliverChildListDelegate], which are
    commonly used subclasses of [SliverChildDelegate] that use a builder
    callback and an explicit child list, respectively.
 

## Constructors

### Unnamed Constructor
Initializes fields for subclasses.


# Overview for `PrimaryScrollController`

## Description

Associates a [ScrollController] with a subtree.

 

 When a [ScrollView] has [ScrollView.primary] set to true, the [ScrollView]
 uses [of] to inherit the [PrimaryScrollController] associated with its
 subtree.

 A ScrollView that doesn't have a controller or the primary flag set will
 inherit the PrimaryScrollController, if [shouldInherit] allows it. By
 default [shouldInherit] is true for mobile platforms when the ScrollView has
 a scroll direction of [Axis.vertical]. This automatic inheritance can be
 configured with [automaticallyInheritForPlatforms] and [scrollDirection].

 Inheriting this ScrollController can provide default behavior for scroll
 views in a subtree. For example, the [Scaffold] uses this mechanism to
 implement the scroll-to-top gesture on iOS.

 Another default behavior handled by the PrimaryScrollController is default
 [ScrollAction]s. If a ScrollAction is not handled by an otherwise focused
 part of the application, the ScrollAction will be evaluated using the scroll
 view associated with a PrimaryScrollController, for example, when executing
 [Shortcuts] key events like page up and down.

 See also:
   * [ScrollAction], an [Action] that scrolls the [Scrollable] that encloses
     the current [primaryFocus] or is attached to the PrimaryScrollController.
   * [Shortcuts], a widget that establishes a [ShortcutManager] to be used
     by its descendants when invoking an [Action] via a keyboard key
     combination that maps to an [Intent].

## Dependencies

- InheritedWidget

## Members

- **controller**: `ScrollController?`
  The [ScrollController] associated with the subtree.

 See also:

  * [ScrollView.controller], which discusses the purpose of specifying a
    scroll controller.

- **scrollDirection**: `Axis?`
  The [Axis] this controller is configured for [ScrollView]s to
 automatically inherit.

 Used in conjunction with [automaticallyInheritForPlatforms]. If the
 current [TargetPlatform] is not included in
 [automaticallyInheritForPlatforms], this is ignored.

 When null, no [ScrollView] in any Axis will automatically inherit this
 controller. This is dissimilar to [PrimaryScrollController.none]. When a
 PrimaryScrollController is inherited, ScrollView will insert
 PrimaryScrollController.none into the tree to prevent further descendant
 ScrollViews from inheriting the current PrimaryScrollController.

 For the direction in which active scrolling may be occurring, see
 [ScrollDirection].

 Defaults to [Axis.vertical].

- **automaticallyInheritForPlatforms**: `Set&lt;TargetPlatform&gt;`
  The [TargetPlatform]s this controller is configured for [ScrollView]s to
 automatically inherit.

 Used in conjunction with [scrollDirection]. If the [Axis] provided to
 [shouldInherit] is not [scrollDirection], this is ignored.

 When empty, no ScrollView in any Axis will automatically inherit this
 controller. Defaults to [TargetPlatformVariant.mobile].

## Constructors

### Unnamed Constructor
Creates a widget that associates a [ScrollController] with a subtree.

### none
Creates a subtree without an associated [ScrollController].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`

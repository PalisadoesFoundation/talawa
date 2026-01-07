# Overview for `ScrollableDetails`

## Description

Describes the aspects of a Scrollable widget to inform inherited widgets
 like [ScrollBehavior] for decorating or enumerate the properties of combined
 Scrollables, such as [TwoDimensionalScrollable].

 Decorations like [GlowingOverscrollIndicator]s and [Scrollbar]s require
 information about the Scrollable in order to be initialized.

## Members

- **direction**: `AxisDirection`
  

- **controller**: `ScrollController?`
  

- **physics**: `ScrollPhysics?`
  

- **decorationClipBehavior**: `Clip?`
  

 This can be used by [MaterialScrollBehavior] to clip a
 [StretchingOverscrollIndicator].

 This [Clip] does not affect the [Viewport.clipBehavior], but is rather
 passed from the same value by [Scrollable] so that decorators like
 [StretchingOverscrollIndicator] honor the same clip.

 Defaults to null.

## Constructors

### Unnamed Constructor
Creates a set of details describing the [Scrollable].

### vertical
A constructor specific to a [Scrollable] with an [Axis.vertical].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### horizontal
A constructor specific to a [Scrollable] with an [Axis.horizontal].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

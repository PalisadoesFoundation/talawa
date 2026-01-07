# Overview for `View`

## Description

Bootstraps a render tree that is rendered into the provided [FlutterView].

 The content rendered into that view is determined by the provided [child].
 Descendants within the same [LookupBoundary] can look up the view they are
 rendered into via [View.of] and [View.maybeOf].

 The provided [child] is wrapped in a [MediaQuery] constructed from the given
 [view], a [FocusScope], and a [RawView] widget.

 For most use cases, using [MediaQuery.of], or its associated "...Of" methods
 are a more appropriate way of obtaining the information that a [FlutterView]
 exposes. For example, using [MediaQuery.sizeOf] will expose the _logical_
 device size ([MediaQueryData.size]) rather than the physical size
 ([FlutterView.physicalSize]). Similarly, while [FlutterView.padding] conveys
 the information from the operating system, the [MediaQueryData.padding]
 attribute (obtained from [MediaQuery.paddingOf]) further adjusts this
 information to be aware of the context of the widget; e.g. the [Scaffold]
 widget adjusts the values for its various children.

 Each [FlutterView] can be associated with at most one [View] or [RawView]
 widget in the widget tree. Two or more [View] or [RawView] widgets
 configured with the same [FlutterView] must never exist within the same
 widget tree at the same time. This limitation is enforced by a
 [GlobalObjectKey] that derives its identity from the [view] provided to this
 widget.

 Since the [View] widget bootstraps its own independent render tree using its
 embedded [RawView], neither it nor any of its descendants will insert a
 [RenderObject] into an existing render tree. Therefore, the [View] widget
 can only be used in those parts of the widget tree where it is not required
 to participate in the construction of the surrounding render tree. In other
 words, the widget may only be used in a non-rendering zone of the widget
 tree (see [WidgetsBinding] for a definition of rendering and non-rendering
 zones).

 In practical terms, the widget is typically used at the root of the widget
 tree outside of any other [View] or [RawView] widget, as a child of a
 [ViewCollection] widget, or in the [ViewAnchor.view] slot of a [ViewAnchor]
 widget. It is not required to be a direct child, though, since other
 non-[RenderObjectWidget]s (e.g. [InheritedWidget]s, [Builder]s, or
 [StatefulWidget]s/[StatelessWidget]s that only produce
 non-[RenderObjectWidget]s) are allowed to be present between those widgets
 and the [View] widget.

 See also:

 * [RawView], the workhorse that [View] uses to create the render tree, but
   without the [MediaQuery] and [FocusScope] that [View] adds.
 * [Element.debugExpectsRenderObjectForSlot], which defines whether a [View]
   widget is allowed in a given child slot.

## Dependencies

- StatefulWidget

## Members

- **view**: `FlutterView`
  The [FlutterView] into which [child] is drawn.

- **child**: `Widget`
  The widget below this widget in the tree, which will be drawn into the
 [view].

 

- **_deprecatedPipelineOwner**: `PipelineOwner?`
- **_deprecatedRenderView**: `RenderView?`
## Constructors

### Unnamed Constructor
Create a [View] widget to bootstrap a render tree that is rendered into
 the provided [FlutterView].

 The content rendered into that [view] is determined by the given [child]
 widget.


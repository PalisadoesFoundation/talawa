# Overview for `RawView`

## Description

The lower level workhorse widget for [View] that bootstraps a render tree
 for a view.

 Typically, the [View] widget is used instead of a [RawView] widget to create
 a view, since, in addition to creating a view, it also adds some useful
 widgets, such as a [MediaQuery] and [FocusScope]. The [RawView] widget is
 only used directly if it is not desirable to have these additional widgets
 around the resulting widget tree. The [View] widget uses the [RawView]
 widget internally to manage its [FlutterView].

 This widget can be used at the root of the widget tree outside of any other
 [View] or [RawView] widget, as a child to a [ViewCollection], or in the
 [ViewAnchor.view] slot of a [ViewAnchor] widget. It is not required to be a
 direct child of those widgets; other non-[RenderObjectWidget]s may appear in
 between the two (such as an [InheritedWidget]).

 Each [FlutterView] can be associated with at most one [View] or [RawView]
 widget in the widget tree. Two or more [View] or [RawView] widgets
 configured with the same [FlutterView] must never exist within the same
 widget tree at the same time. This limitation is enforced by a
 [GlobalObjectKey] that derives its identity from the [view] provided to this
 widget.

 Since the [RawView] widget bootstraps its own independent render tree,
 neither it nor any of its descendants will insert a [RenderObject] into an
 existing render tree. Therefore, the [RawView] widget can only be used in
 those parts of the widget tree where it is not required to participate in
 the construction of the surrounding render tree. In other words, the widget
 may only be used in a non-rendering zone of the widget tree (see
 [WidgetsBinding] for a definition of rendering and non-rendering zones).

 To find the [FlutterView] associated with a [BuildContext], use [View.of] or
 [View.maybeOf], even if the view was created using [RawView] instead of
 [View].

 See also:

 * [View] for a higher level interface that also sets up a [MediaQuery] and
   [FocusScope] for the view's widget tree.

## Dependencies

- StatelessWidget

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
Creates a [RawView] widget.


# Overview for `RenderObject`

## Description

An object in the render tree.

 The [RenderObject] class hierarchy is the core of the rendering
 library's reason for being.

 

 [RenderObject]s have a [parent], and have a slot called [parentData] in
 which the parent [RenderObject] can store child-specific data, for example,
 the child position. The [RenderObject] class also implements the basic
 layout and paint protocols.

 The [RenderObject] class, however, does not define a child model (e.g.
 whether a node has zero, one, or more children). It also doesn't define a
 coordinate system (e.g. whether children are positioned in Cartesian
 coordinates, in polar coordinates, etc) or a specific layout protocol (e.g.
 whether the layout is width-in-height-out, or constraint-in-size-out, or
 whether the parent sets the size and position of the child before or after
 the child lays out, etc; or indeed whether the children are allowed to read
 their parent's [parentData] slot).

 The [RenderBox] subclass introduces the opinion that the layout
 system uses Cartesian coordinates.

 ## Lifecycle

 A [RenderObject] must [dispose] when it is no longer needed. The creator
 of the object is responsible for disposing of it. Typically, the creator is
 a [RenderObjectElement], and that element will dispose the object it creates
 when it is unmounted.

 [RenderObject]s are responsible for cleaning up any expensive resources
 they hold when [dispose] is called, such as [Picture] or [Image] objects.
 This includes any [Layer]s that the render object has directly created. The
 base implementation of dispose will nullify the [layer] property. Subclasses
 must also nullify any other layer(s) it directly creates.

 ## Writing a RenderObject subclass

 In most cases, subclassing [RenderObject] itself is overkill, and
 [RenderBox] would be a better starting point. However, if a render object
 doesn't want to use a Cartesian coordinate system, then it should indeed
 inherit from [RenderObject] directly. This allows it to define its own
 layout protocol by using a new subclass of [Constraints] rather than using
 [BoxConstraints], and by potentially using an entirely new set of objects
 and values to represent the result of the output rather than just a [Size].
 This increased flexibility comes at the cost of not being able to rely on
 the features of [RenderBox]. For example, [RenderBox] implements an
 intrinsic sizing protocol that allows you to measure a child without fully
 laying it out, in such a way that if that child changes size, the parent
 will be laid out again (to take into account the new dimensions of the
 child). This is a subtle and bug-prone feature to get right.

 Most aspects of writing a [RenderBox] apply to writing a [RenderObject] as
 well, and therefore the discussion at [RenderBox] is recommended background
 reading. The main differences are around layout and hit testing, since those
 are the aspects that [RenderBox] primarily specializes.

 ### Layout

 A layout protocol begins with a subclass of [Constraints]. See the
 discussion at [Constraints] for more information on how to write a
 [Constraints] subclass.

 The [performLayout] method should take the [constraints], and apply them.
 The output of the layout algorithm is fields set on the object that describe
 the geometry of the object for the purposes of the parent's layout. For
 example, with [RenderBox] the output is the [RenderBox.size] field. This
 output should only be read by the parent if the parent specified
 `parentUsesSize` as true when calling [layout] on the child.

 Anytime anything changes on a render object that would affect the layout of
 that object, it should call [markNeedsLayout].

 ### Hit Testing

 Hit testing is even more open-ended than layout. There is no method to
 override, you are expected to provide one.

 The general behavior of your hit-testing method should be similar to the
 behavior described for [RenderBox]. The main difference is that the input
 need not be an [Offset]. You are also allowed to use a different subclass of
 [HitTestEntry] when adding entries to the [HitTestResult]. When the
 [handleEvent] method is called, the same object that was added to the
 [HitTestResult] will be passed in, so it can be used to track information
 like the precise coordinate of the hit, in whatever coordinate system is
 used by the new layout protocol.

 ### Adapting from one protocol to another

 In general, the root of a Flutter render object tree is a [RenderView]. This
 object has a single child, which must be a [RenderBox]. Thus, if you want to
 have a custom [RenderObject] subclass in the render tree, you have two
 choices: you either need to replace the [RenderView] itself, or you need to
 have a [RenderBox] that has your class as its child. (The latter is the much
 more common case.)

 This [RenderBox] subclass converts from the box protocol to the protocol of
 your class.

 In particular, this means that for hit testing it overrides
 [RenderBox.hitTest], and calls whatever method you have in your class for
 hit testing.

 Similarly, it overrides [performLayout] to create a [Constraints] object
 appropriate for your class and passes that to the child's [layout] method.

 ### Layout interactions between render objects

 In general, the layout of a render object should only depend on the output of
 its child's layout, and then only if `parentUsesSize` is set to true in the
 [layout] call. Furthermore, if it is set to true, the parent must call the
 child's [layout] if the child is to be rendered, because otherwise the
 parent will not be notified when the child changes its layout outputs.

 It is possible to set up render object protocols that transfer additional
 information. For example, in the [RenderBox] protocol you can query your
 children's intrinsic dimensions and baseline geometry. However, if this is
 done then it is imperative that the child call [markNeedsLayout] on the
 parent any time that additional information changes, if the parent used it
 in the last layout phase. For an example of how to implement this, see the
 [RenderBox.markNeedsLayout] method. It overrides
 [RenderObject.markNeedsLayout] so that if a parent has queried the intrinsic
 or baseline information, it gets marked dirty whenever the child's geometry
 changes.

## Dependencies

- DiagnosticableTreeMixin, HitTestTarget

## Members

- **_debugDisposed**: `bool`
- **parentData**: `ParentData?`
  Data for use by the parent render object.

 The parent data is used by the render object that lays out this object
 (typically this object's parent in the render tree) to store information
 relevant to itself and to any other nodes who happen to know exactly what
 the data means. The parent data is opaque to the child.

  * The parent data field must not be directly set, except by calling
    [setupParentData] on the parent node.
  * The parent data can be set before the child is added to the parent, by
    calling [setupParentData] on the future parent node.
  * The conventions for using the parent data depend on the layout protocol
    used between the parent and child. For example, in box layout, the
    parent data is completely opaque but in sector layout the child is
    permitted to read some fields of the parent data.

- **_depth**: `int`
- **_parent**: `RenderObject?`
- **debugCreator**: `Object?`
  The object responsible for creating this render object.

 Used in debug messages.

 See also:

  * [DebugCreator], which the [widgets] library uses as values for this field.

- **_debugDoingThisResize**: `bool`
- **_debugDoingThisLayout**: `bool`
- **_debugActiveLayout**: `RenderObject?`
- **_debugCanParentUseSize**: `bool?`
- **_debugMutationsLocked**: `bool`
- **_owner**: `PipelineOwner?`
- **_needsLayout**: `bool`
- **_isRelayoutBoundary**: `bool?`
  Whether this [RenderObject] is a known relayout boundary.

 A relayout boundary is a [RenderObject] whose parent does not rely on the
 child [RenderObject]'s size in its own layout algorithm. In other words,
 if a [RenderObject]'s [performLayout] implementation does not ask the child
 for its size at all, **the child** is a relayout boundary.

 The type of "size" is typically defined by the coordinate system a
 [RenderObject] subclass uses. For instance, [RenderSliver]s produce
 [SliverGeometry] and [RenderBox]es produce [Size]. A parent [RenderObject]
 may not read the child's size but still depend on the child's layout (using
 a [RenderBox] child's baseline location, for example), this flag does not
 reflect such dependencies and the [RenderObject] subclass must handle those
 cases in its own implementation. See [RenderBox.markNeedsLayout] for an
 example.

 Relayout boundaries enable an important layout optimization: the parent not
 depending on the size of a child means the child changing size does not
 affect the layout of the parent. When a relayout boundary is marked as
 needing layout, its parent does not have to be marked as dirty, hence the
 name. For details, see [markNeedsLayout].

 This flag is typically set in [RenderObject.layout], and consulted by
 [markNeedsLayout] in deciding whether to recursively mark the parent as
 also needing layout.

 The flag is initially set to `null` when [layout] has yet been called, and
 reset to `null` when the parent drops this child via [dropChild].

- **_doingThisLayoutWithCallback**: `bool`
- **_constraints**: `Constraints?`
- **debugCheckingIntrinsics**: `bool`
  When true, a debug method ([debugAssertDoesMeetConstraints], for instance)
 is currently executing asserts for verifying the consistent behavior of
 intrinsic dimensions methods.

 This is typically set by framework debug methods. It is read by tests to
 selectively ignore custom layout callbacks. It should not be set outside of
 intrinsic-checking debug methods, and should not be checked in release mode
 (where it will always be false).

- **_debugDoingThisPaint**: `bool`
- **_debugActivePaint**: `RenderObject?`
- **_wasRepaintBoundary**: `bool`
- **_layerHandle**: `LayerHandle&lt;ContainerLayer&gt;`
- **_needsCompositingBitsUpdate**: `bool`
- **_needsCompositing**: `bool`
- **_needsPaint**: `bool`
- **_needsCompositedLayerUpdate**: `bool`
- **_semantics**: `_RenderObjectSemantics`
## Constructors

### Unnamed Constructor
Initializes internal fields for subclasses.


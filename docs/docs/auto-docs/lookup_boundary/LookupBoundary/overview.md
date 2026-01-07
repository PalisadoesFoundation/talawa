# Overview for `LookupBoundary`

## Description

A lookup boundary controls what entities are visible to descendants of the
 boundary via the static lookup methods provided by the boundary.

 The static lookup methods of the boundary mirror the lookup methods by the
 same name exposed on [BuildContext] and they can be used as direct
 replacements. Unlike the methods on [BuildContext], these methods do not
 find any ancestor entities of the closest [LookupBoundary] surrounding the
 provided [BuildContext]. The root of the tree is an implicit lookup boundary.

 
 In the example below, the [LookupBoundary.findAncestorWidgetOfExactType]
 call returns null because the [LookupBoundary] "hides" `MyWidget` from the
 [BuildContext] that was queried.

 ```dart
 MyWidget(
   child: LookupBoundary(
     child: Builder(
       builder: (BuildContext context) ,
     ),
   ),
 )
 ```
 

 A [LookupBoundary] only affects the behavior of the static lookup methods
 defined on the boundary. It does not affect the behavior of the lookup
 methods defined on [BuildContext].

 A [LookupBoundary] is rarely instantiated directly. They are inserted at
 locations of the widget tree where the render tree diverges from the element
 tree, which is rather uncommon. Such anomalies are created by
 [RenderObjectElement]s that don't attach their [RenderObject] to the closest
 ancestor [RenderObjectElement], e.g. because they bootstrap a separate
 stand-alone render tree. This behavior breaks the assumption some widgets
 have about the structure of the render tree: These widgets may try to reach
 out to an ancestor widget, assuming that their associated [RenderObject]s
 are also ancestors, which due to the anomaly may not be the case. At the
 point where the divergence in the two trees is introduced, a
 [LookupBoundary] can be used to hide that ancestor from the querying widget.
 The [ViewAnchor], for example, wraps its [ViewAnchor.view] child in a
 [LookupBoundary] because the [RenderObject] produced by that widget subtree
 is not attached to the render tree that the [ViewAnchor] itself belongs to.

 As an example, [Material.of] relies on lookup boundaries to hide the
 [Material] widget from certain descendant button widget. Buttons reach out
 to their [Material] ancestor to draw ink splashes on its associated render
 object. This only produces the desired effect if the button render object
 is a descendant of the [Material] render object. If the element tree and
 the render tree are not in sync due to anomalies described above, this may
 not be the case. To avoid incorrect visuals, the [Material] relies on
 lookup boundaries to hide itself from descendants in subtrees with such
 anomalies. Those subtrees are expected to introduce their own [Material]
 widget that buttons there can utilize without crossing a lookup boundary.

## Dependencies

- InheritedWidget

## Constructors

### Unnamed Constructor
Creates a [LookupBoundary].

 A none-null [child] widget must be provided.


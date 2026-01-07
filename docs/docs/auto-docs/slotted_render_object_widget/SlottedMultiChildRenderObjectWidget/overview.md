# Overview for `SlottedMultiChildRenderObjectWidget`

## Description

A superclass for [RenderObjectWidget]s that configure [RenderObject]
 subclasses that organize their children in different slots.

 Implementers of this mixin have to provide the list of available slots by
 overriding [slots]. The list of slots must never change for a given class
 implementing this mixin. In the common case, [Enum] values are used as slots
 and [slots] is typically implemented to return the value of the enum's
 `values` getter.

 Furthermore, [childForSlot] must be implemented to return the current
 widget configuration for a given slot.

 The [RenderObject] returned by [createRenderObject] and updated by
 [updateRenderObject] must implement [SlottedContainerRenderObjectMixin].

 The type parameter `SlotType` is the type for the slots to be used by this
 [RenderObjectWidget] and the [RenderObject] it configures. In the typical
 case, `SlotType` is an [Enum] type.

 The type parameter `ChildType` is the type used for the [RenderObject] children
 (e.g. [RenderBox] or [RenderSliver]). In the typical case, `ChildType` is
 [RenderBox]. This class does not support having different kinds of children
 for different slots.

 
 This example uses the [SlottedMultiChildRenderObjectWidget] in
 combination with the [SlottedContainerRenderObjectMixin] to implement a
 widget that provides two slots: topLeft and bottomRight. The widget arranges
 the children in those slots diagonally.

 ** See code in examples/api/lib/widgets/slotted_render_object_widget/slotted_multi_child_render_object_widget_mixin.0.dart **
 

 See also:

   * [MultiChildRenderObjectWidget], which configures a [RenderObject]
     with a single list of children.
   * [ListTile], which uses [SlottedMultiChildRenderObjectWidget] in its
     internal (private) implementation.

## Dependencies

- RenderObjectWidget, SlottedMultiChildRenderObjectWidgetMixin

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.


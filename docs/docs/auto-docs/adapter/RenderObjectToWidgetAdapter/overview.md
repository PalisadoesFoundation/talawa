# Overview for `RenderObjectToWidgetAdapter`

## Description

A bridge from a [RenderObject] to an [Element] tree.

 The given container is the [RenderObject] that the [Element] tree should be
 inserted into. It must be a [RenderObject] that implements the
 [RenderObjectWithChildMixin] protocol. The type argument `T` is the kind of
 [RenderObject] that the container expects as its child.

 The [RenderObjectToWidgetAdapter] is an alternative to [RootWidget] for
 bootstrapping an element tree. Unlike [RootWidget] it requires the
 existence of a render tree (the [container]) to attach the element tree to.

## Dependencies

- RenderObjectWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **container**: `RenderObjectWithChildMixin&lt;T&gt;`
  The [RenderObject] that is the parent of the [Element] created by this widget.

- **debugShortDescription**: `String?`
  A short description of this widget used by debugging aids.

## Constructors

### Unnamed Constructor
Creates a bridge from a [RenderObject] to an [Element] tree.


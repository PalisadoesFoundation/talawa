# Overview for `RenderObjectToWidgetElement`

## Description

The root of an element tree that is hosted by a [RenderObject].

 This element class is the instantiation of a [RenderObjectToWidgetAdapter]
 widget. It can be used only as the root of an [Element] tree (it cannot be
 mounted into another [Element]; it's parent must be null).

 In typical usage, it will be instantiated for a [RenderObjectToWidgetAdapter]
 whose container is the [RenderView].

## Dependencies

- RenderTreeRootElement, RootElementMixin

## Members

- **_child**: `Element?`
- **_rootChildSlot**: `Object`
- **_newWidget**: `Widget?`
## Constructors

### Unnamed Constructor
Creates an element that is hosted by a [RenderObject].

 The [RenderObject] created by this element is not automatically set as a
 child of the hosting [RenderObject]. To actually attach this element to
 the render tree, call [RenderObjectToWidgetAdapter.attachToRenderTree].


# Overview for `ReorderableListView`

## Description

A list whose items the user can interactively reorder by dragging.

 

 This sample shows by dragging the user can reorder the items of the list.
 The [onReorder] parameter is required and will be called when a child
 widget is dragged to a new position.

 

 ** See code in examples/api/lib/material/reorderable_list/reorderable_list_view.0.dart **
 

 By default, on [TargetPlatformVariant.desktop] platforms each item will
 have a drag handle added on top of it that will allow the user to grab it
 to move the item. On [TargetPlatformVariant.mobile], no drag handle will be
 added, but when the user long presses anywhere on the item it will start
 moving the item. Displaying drag handles can be controlled with
 [ReorderableListView.buildDefaultDragHandles].

 All list items must have a key.

 This example demonstrates using the [ReorderableListView.proxyDecorator] callback
 to customize the appearance of a list item while it's being dragged.

 
 While a drag is underway, the widget returned by the [ReorderableListView.proxyDecorator]
 callback serves as a "proxy" (a substitute) for the item in the list. The proxy is
 created with the original list item as its child. The [ReorderableListView.proxyDecorator]
 callback in this example is similar to the default one except that it changes the
 proxy item's background color.

 ** See code in examples/api/lib/material/reorderable_list/reorderable_list_view.1.dart **
 

 This example demonstrates using the [ReorderableListView.proxyDecorator] callback to
 customize the appearance of a [Card] while it's being dragged.

 
 The default [proxyDecorator] wraps the dragged item in a [Material] widget and animates
 its elevation. This example demonstrates how to use the [ReorderableListView.proxyDecorator]
 callback to update the dragged card elevation without inserted a new [Material] widget.

 ** See code in examples/api/lib/material/reorderable_list/reorderable_list_view.2.dart **
 

## Dependencies

- StatefulWidget

## Members

- **itemBuilder**: `IndexedWidgetBuilder`
  

- **itemCount**: `int`
  

- **onReorder**: `ReorderCallback`
  

- **onReorderStart**: `void Function(int index)?`
  

- **onReorderEnd**: `void Function(int index)?`
  

- **proxyDecorator**: `ReorderItemProxyDecorator?`
  

- **buildDefaultDragHandles**: `bool`
  If true: on desktop platforms, a drag handle is stacked over the
 center of each item's trailing edge; on mobile platforms, a long
 press anywhere on the item starts a drag.

 The default desktop drag handle is just an [Icons.drag_handle]
 wrapped by a [ReorderableDragStartListener]. On mobile
 platforms, the entire item is wrapped with a
 [ReorderableDelayedDragStartListener].

 To change the appearance or the layout of the drag handles, make
 this parameter false and wrap each list item, or a widget within
 each list item, with [ReorderableDragStartListener] or
 [ReorderableDelayedDragStartListener], or a custom subclass
 of [ReorderableDragStartListener].

 The following sample specifies `buildDefaultDragHandles: false`, and
 uses a [Card] at the leading edge of each item for the item's drag handle.

 


 ** See code in examples/api/lib/material/reorderable_list/reorderable_list_view.build_default_drag_handles.0.dart **
 

- **padding**: `EdgeInsets?`
  

- **header**: `Widget?`
  A non-reorderable header item to show before the items of the list.

 If null, no header will appear before the list.

- **footer**: `Widget?`
  A non-reorderable footer item to show after the items of the list.

 If null, no footer will appear after the list.

- **scrollDirection**: `Axis`
  

- **reverse**: `bool`
  

- **scrollController**: `ScrollController?`
  

- **primary**: `bool?`
  
 Defaults to true when [scrollDirection] is [Axis.vertical] and
 [scrollController] is null.

- **physics**: `ScrollPhysics?`
  

- **shrinkWrap**: `bool`
  

- **anchor**: `double`
  

- **cacheExtent**: `double?`
  

- **dragStartBehavior**: `DragStartBehavior`
  

- **keyboardDismissBehavior**: `ScrollViewKeyboardDismissBehavior?`
  

 If [keyboardDismissBehavior] is null then it will fallback to the inherited
 [ScrollBehavior.getKeyboardDismissBehavior].

- **restorationId**: `String?`
  

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **itemExtent**: `double?`
  

- **itemExtentBuilder**: `ItemExtentBuilder?`
  

- **prototypeItem**: `Widget?`
  

- **autoScrollerVelocityScalar**: `double?`
  

 

- **dragBoundaryProvider**: `ReorderDragBoundaryProvider?`
  

- **mouseCursor**: `MouseCursor?`
  The cursor for a mouse pointer when it enters or is hovering over the drag
 handle.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.dragged].

 If this property is null, [SystemMouseCursors.grab] will be used when
  hovering, and [SystemMouseCursors.grabbing] when dragging.

## Constructors

### Unnamed Constructor
Creates a reorderable list from a pre-built list of widgets.

 This constructor is appropriate for lists with a small number of
 children because constructing the [List] requires doing work for every
 child that could possibly be displayed in the list view instead of just
 those children that are actually visible.

 See also:

   * [ReorderableListView.builder], which allows you to build a reorderable
     list where the items are built as needed when scrolling the list.

### builder
Creates a reorderable list from widget items that are created on demand.

 This constructor is appropriate for list views with a large number of
 children because the builder is called only for those children
 that are actually visible.

 The `itemBuilder` callback will be called only with indices greater than
 or equal to zero and less than `itemCount`.

 The `itemBuilder` should always return a non-null widget, and actually
 create the widget instances when called. Avoid using a builder that
 returns a previously-constructed widget; if the list view's children are
 created in advance, or all at once when the [ReorderableListView] itself
 is created, it is more efficient to use the [ReorderableListView]
 constructor. Even more efficient, however, is to create the instances
 on demand using this constructor's `itemBuilder` callback.

 This example creates a list using the
 [ReorderableListView.builder] constructor. Using the [IndexedWidgetBuilder], The
 list items are built lazily on demand.
 

 ** See code in examples/api/lib/material/reorderable_list/reorderable_list_view.reorderable_list_view_builder.0.dart **
 
 See also:

   * [ReorderableListView], which allows you to build a reorderable
     list with all the items passed into the constructor.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

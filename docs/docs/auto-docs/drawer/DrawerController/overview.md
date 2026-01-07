# Overview for `DrawerController`

## Description

Provides interactive behavior for [Drawer] widgets.

 Rarely used directly. Drawer controllers are typically created automatically
 by [Scaffold] widgets.

 The drawer controller provides the ability to open and close a drawer, either
 via an animation or via user interaction. When closed, the drawer collapses
 to a translucent gesture detector that can be used to listen for edge
 swipes.

 See also:

  * [Drawer], a container with the default width of a drawer.
  * [Scaffold.drawer], the [Scaffold] slot for showing a drawer.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 Typically a [Drawer].

- **alignment**: `DrawerAlignment`
  The alignment of the [Drawer].

 This controls the direction in which the user should swipe to open and
 close the drawer.

- **drawerCallback**: `DrawerCallback?`
  Optional callback that is called when a [Drawer] is opened or closed.

- **dragStartBehavior**: `DragStartBehavior`
  
 Determines the way that drag start behavior is handled.

 If set to [DragStartBehavior.start], the drag behavior used for opening
 and closing a drawer will begin at the position where the drag gesture won
 the arena. If set to [DragStartBehavior.down] it will begin at the position
 where a down event is first detected.

 In general, setting this to [DragStartBehavior.start] will make drag
 animation smoother and setting it to [DragStartBehavior.down] will make
 drag behavior feel slightly more reactive.

 By default, the drag start behavior is [DragStartBehavior.start].

 See also:

  * [DragGestureRecognizer.dragStartBehavior], which gives an example for
    the different behaviors.

 

- **scrimColor**: `Color?`
  The color to use for the scrim that obscures the underlying content while
 a drawer is open.

 If this is null, then [DrawerThemeData.scrimColor] is used. If that
 is also null, then it defaults to [Colors.black54].

- **enableOpenDragGesture**: `bool`
  Determines if the [Drawer] can be opened with a drag gesture.

 By default, the drag gesture is enabled.

- **edgeDragWidth**: `double?`
  The width of the area within which a horizontal swipe will open the
 drawer.

 By default, the value used is 20.0 added to the padding edge of
 `MediaQuery.paddingOf(context)` that corresponds to [alignment].
 This ensures that the drag area for notched devices is not obscured. For
 example, if [alignment] is set to [DrawerAlignment.start] and
 `TextDirection.of(context)` is set to [TextDirection.ltr],
 20.0 will be added to `MediaQuery.paddingOf(context).left`.

- **isDrawerOpen**: `bool`
  Whether or not the drawer is opened or closed.

 This parameter is primarily used by the state restoration framework
 to restore the drawer's animation controller to the open or closed state
 depending on what was last saved to the target platform before the
 application was killed.

## Constructors

### Unnamed Constructor
Creates a controller for a [Drawer].

 Rarely used directly.

 The [child] argument is typically a [Drawer].


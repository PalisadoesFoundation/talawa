# Overview for `OverlayEntry`

## Description

A place in an [Overlay] that can contain a widget.

 Overlay entries are inserted into an [Overlay] using the
 [OverlayState.insert] or [OverlayState.insertAll] functions. To find the
 closest enclosing overlay for a given [BuildContext], use the [Overlay.of]
 function.

 An overlay entry can be in at most one overlay at a time. To remove an entry
 from its overlay, call the [remove] function on the overlay entry.

 Because an [Overlay] uses a [Stack] layout, overlay entries can use
 [Positioned] and [AnimatedPositioned] to position themselves within the
 overlay.

 For example, [Draggable] uses an [OverlayEntry] to show the drag avatar that
 follows the user's finger across the screen after the drag begins. Using the
 overlay to display the drag avatar lets the avatar float over the other
 widgets in the app. As the user's finger moves, draggable calls
 [markNeedsBuild] on the overlay entry to cause it to rebuild. In its build,
 the entry includes a [Positioned] with its top and left property set to
 position the drag avatar near the user's finger. When the drag is over,
 [Draggable] removes the entry from the overlay to remove the drag avatar
 from view.

 By default, if there is an entirely [opaque] entry over this one, then this
 one will not be included in the widget tree (in particular, stateful widgets
 within the overlay entry will not be instantiated). To ensure that your
 overlay entry is still built even if it is not visible, set [maintainState]
 to true. This is more expensive, so should be done with care. In particular,
 if widgets in an overlay entry with [maintainState] set to true repeatedly
 call [State.setState], the user's battery will be drained unnecessarily.

 [OverlayEntry] is a [Listenable] that notifies when the widget built by
 [builder] is mounted or unmounted, whose exact state can be queried by
 [mounted]. After the owner of the [OverlayEntry] calls [remove] and then
 [dispose], the widget may not be immediately removed from the widget tree.
 As a result listeners of the [OverlayEntry] can get notified for one last
 time after the [dispose] call, when the widget is eventually unmounted.

 

 See also:

  * [OverlayPortal], an alternative API for inserting widgets into an
    [Overlay] using a builder callback.
  * [Overlay], a stack of entries that can be managed independently.
  * [OverlayState], the current state of an Overlay.
  * [WidgetsApp], a convenience widget that wraps a number of widgets that
    are commonly required for an application.
  * [MaterialApp], a convenience widget that wraps a number of widgets that
    are commonly required for Material Design applications.

## Dependencies

- Listenable

## Members

- **builder**: `WidgetBuilder`
  This entry will include the widget built by this builder in the overlay at
 the entry's position.

 To cause this builder to be called again, call [markNeedsBuild] on this
 overlay entry.

- **_opaque**: `bool`
- **_maintainState**: `bool`
- **canSizeOverlay**: `bool`
  Whether the content of this [OverlayEntry] can be used to size the
 [Overlay].

 In most situations the overlay sizes itself based on its incoming
 constraints to be as large as possible. However, if that would result in
 an infinite size, it has to rely on one of its children to size itself. In
 this situation, the overlay will consult the topmost non-[Positioned]
 overlay entry that has this property set to true, lay it out with the
 incoming [BoxConstraints] of the overlay, and force all other
 non-[Positioned] overlay entries to have the same size. The [Positioned]
 entries are laid out as usual based on the calculated size of the overlay.

 Overlay entries that set this to true must be able to handle unconstrained
 [BoxConstraints].

 Setting this to true has no effect if the overlay entry uses a [Positioned]
 widget to position itself in the overlay.

- **_overlayEntryStateNotifier**: `ValueNotifier<_OverlayEntryWidgetState?>?`
  The currently mounted `_OverlayEntryWidgetState` built using this [OverlayEntry].

- **_overlay**: `OverlayState?`
- **_key**: `GlobalKey&lt;_OverlayEntryWidgetState&gt;`
- **_disposedByOwner**: `bool`
## Constructors

### Unnamed Constructor
Creates an overlay entry.

 To insert the entry into an [Overlay], first find the overlay using
 [Overlay.of] and then call [OverlayState.insert]. To remove the entry,
 call [remove] on the overlay entry itself.


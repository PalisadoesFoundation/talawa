# Overview for `Overlay`

## Description

A stack of entries that can be managed independently.

 Overlays let independent child widgets "float" visual elements on top of
 other widgets by inserting them into the overlay's stack. The overlay lets
 each of these widgets manage their participation in the overlay using
 [OverlayEntry] objects.

 Although you can create an [Overlay] directly, it's most common to use the
 overlay created by the [Navigator] in a [WidgetsApp], [CupertinoApp] or a
 [MaterialApp]. The navigator uses its overlay to manage the visual
 appearance of its routes.

 The [Overlay] widget uses a custom stack implementation, which is very
 similar to the [Stack] widget. The main use case of [Overlay] is related to
 navigation and being able to insert widgets on top of the pages in an app.
 For layout purposes unrelated to navigation, consider using [Stack] instead.

 An [Overlay] widget requires a [Directionality] widget to be in scope, so
 that it can resolve direction-sensitive coordinates of any
 [Positioned.directional] children.

 For widgets drawn in an [OverlayEntry], do not assume that the size of the
 [Overlay] is the size returned by [MediaQuery.sizeOf]. Nested overlays can
 have different sizes.

 
 This example shows how to use the [Overlay] to highlight the [NavigationBar]
 destination.

 ** See code in examples/api/lib/widgets/overlay/overlay.0.dart **
 

 See also:

  * [OverlayEntry], the class that is used for describing the overlay entries.
  * [OverlayState], which is used to insert the entries into the overlay.
  * [WidgetsApp], which inserts an [Overlay] widget indirectly via its [Navigator].
  * [MaterialApp], which inserts an [Overlay] widget indirectly via its [Navigator].
  * [CupertinoApp], which inserts an [Overlay] widget indirectly via its [Navigator].
  * [Stack], which allows directly displaying a stack of widgets.

## Dependencies

- StatefulWidget

## Members

- **initialEntries**: `List&lt;OverlayEntry&gt;`
  The entries to include in the overlay initially.

 These entries are only used when the [OverlayState] is initialized. If you
 are providing a new [Overlay] description for an overlay that's already in
 the tree, then the new entries are ignored.

 To add entries to an [Overlay] that is already in the tree, use
 [Overlay.of] to obtain the [OverlayState] (or assign a [GlobalKey] to the
 [Overlay] widget and obtain the [OverlayState] via
 [GlobalKey.currentState]), and then use [OverlayState.insert] or
 [OverlayState.insertAll].

 To remove an entry from an [Overlay], use [OverlayEntry.remove].

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

## Constructors

### Unnamed Constructor
Creates an overlay.

 The initial entries will be inserted into the overlay when its associated
 [OverlayState] is initialized.

 Rather than creating an overlay, consider using the overlay that is
 created by the [Navigator] in a [WidgetsApp], [CupertinoApp], or a
 [MaterialApp] for the application.


# Overview for `ScrollController`

## Description

Controls a scrollable widget.

 Scroll controllers are typically stored as member variables in [State]
 objects and are reused in each [State.build]. A single scroll controller can
 be used to control multiple scrollable widgets, but some operations, such
 as reading the scroll [offset], require the controller to be used with a
 single scrollable widget.

 A scroll controller creates a [ScrollPosition] to manage the state specific
 to an individual [Scrollable] widget. To use a custom [ScrollPosition],
 subclass [ScrollController] and override [createScrollPosition].

 

 Typically used with [ListView], [GridView], [CustomScrollView].

 See also:

  * [ListView], [GridView], [CustomScrollView], which can be controlled by a
    [ScrollController].
  * [Scrollable], which is the lower-level widget that creates and associates
    [ScrollPosition] objects with [ScrollController] objects.
  * [PageController], which is an analogous object for controlling a
    [PageView].
  * [ScrollPosition], which manages the scroll offset for an individual
    scrolling widget.
  * [ScrollNotification] and [NotificationListener], which can be used to
    listen to scrolling occur without using a [ScrollController].

## Dependencies

- ChangeNotifier

## Members

- **_initialScrollOffset**: `double`
- **keepScrollOffset**: `bool`
  Each time a scroll completes, save the current scroll [offset] with
 [PageStorage] and restore it if this controller's scrollable is recreated.

 If this property is set to false, the scroll offset is never saved
 and [initialScrollOffset] is always used to initialize the scroll
 offset. If true (the default), the initial scroll offset is used the
 first time the controller's scrollable is created, since there's no
 scroll offset to restore yet. Subsequently the saved offset is
 restored and [initialScrollOffset] is ignored.

 See also:

  * [PageStorageKey], which should be used when more than one
    scrollable appears in the same route, to distinguish the [PageStorage]
    locations used to save scroll offsets.

- **onAttach**: `ScrollControllerCallback?`
  Called when a [ScrollPosition] is attached to the scroll controller.

 Since a scroll position is not attached until a [Scrollable] is actually
 built, this can be used to respond to a new position being attached.

 At the time that a scroll position is attached, the [ScrollMetrics], such as
 the [ScrollMetrics.maxScrollExtent], are not yet available. These are not
 determined until the [Scrollable] has finished laying out its contents and
 computing things like the full extent of that content.
 [ScrollPosition.hasContentDimensions] can be used to know when the
 metrics are available, or a [ScrollMetricsNotification] can be used,
 discussed further below.

 
 This sample shows how to apply a listener to the
 [ScrollPosition.isScrollingNotifier] using [ScrollController.onAttach].
 This is used to change the [AppBar]'s color when scrolling is occurring.

 ** See code in examples/api/lib/widgets/scroll_position/scroll_controller_on_attach.0.dart **
 

- **onDetach**: `ScrollControllerCallback?`
  Called when a [ScrollPosition] is detached from the scroll controller.

 
 This sample shows how to apply a listener to the
 [ScrollPosition.isScrollingNotifier] using [ScrollController.onAttach]
 & [ScrollController.onDetach].
 This is used to change the [AppBar]'s color when scrolling is occurring.

 ** See code in examples/api/lib/widgets/scroll_position/scroll_controller_on_attach.0.dart **
 

- **debugLabel**: `String?`
  A label that is used in the [toString] output. Intended to aid with
 identifying scroll controller instances in debug output.

- **_positions**: `List&lt;ScrollPosition&gt;`
## Constructors

### Unnamed Constructor
Creates a controller for a scrollable widget.


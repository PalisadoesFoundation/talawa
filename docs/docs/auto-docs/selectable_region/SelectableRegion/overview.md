# Overview for `SelectableRegion`

## Description

A widget that introduces an area for user selections.

 Flutter widgets are not selectable by default. Wrapping a widget subtree
 with a [SelectableRegion] widget enables selection within that subtree (for
 example, [Text] widgets automatically look for selectable regions to enable
 selection). The wrapped subtree can be selected by users using mouse or
 touch gestures, e.g. users can select widgets by holding the mouse
 left-click and dragging across widgets, or they can use long press gestures
 to select words on touch devices.

 A [SelectableRegion] widget requires configuration; in particular specific
 [selectionControls] must be provided.

 The [SelectionArea] widget from the [material] library configures a
 [SelectableRegion] in a platform-specific manner (e.g. using a Material
 toolbar on Android, a Cupertino toolbar on iOS), and it may therefore be
 simpler to use that widget rather than using [SelectableRegion] directly.

 ## An overview of the selection system.

 Every [Selectable] under the [SelectableRegion] can be selected. They form a
 selection tree structure to handle the selection.

 The [SelectableRegion] is a wrapper over [SelectionContainer]. It listens to
 user gestures and sends corresponding [SelectionEvent]s to the
 [SelectionContainer] it creates.

 A [SelectionContainer] is a single [Selectable] that handles
 [SelectionEvent]s on behalf of child [Selectable]s in the subtree. It
 creates a [SelectionRegistrarScope] with its [SelectionContainer.delegate]
 to collect child [Selectable]s and sends the [SelectionEvent]s it receives
 from the parent [SelectionRegistrar] to the appropriate child [Selectable]s.
 It creates an abstraction for the parent [SelectionRegistrar] as if it is
 interacting with a single [Selectable].

 The [SelectionContainer] created by [SelectableRegion] is the root node of a
 selection tree. Each non-leaf node in the tree is a [SelectionContainer],
 and the leaf node is a leaf widget whose render object implements
 [Selectable]. They are connected through [SelectionRegistrarScope]s created
 by [SelectionContainer]s.

 Both [SelectionContainer]s and the leaf [Selectable]s need to register
 themselves to the [SelectionRegistrar] from the
 [SelectionContainer.maybeOf] if they want to participate in the
 selection.

 An example selection tree will look like:

 

 ```dart
 MaterialApp(
   home: SelectableRegion(
     selectionControls: materialTextSelectionControls,
     child: Scaffold(
       appBar: AppBar(title: const Text('Flutter Code Sample')),
       body: ListView(
         children: const <Widget>[
           Text('Item 0', style: TextStyle(fontSize: 50.0)),
           Text('Item 1', style: TextStyle(fontSize: 50.0)),
         ],
       ),
     ),
   ),
 )
 ```
 


               SelectionContainer
               (SelectableRegion)
                  /         \
                 /           \
                /             \
           Selectable          \
      ("Flutter Code Sample")   \
                                 \
                          SelectionContainer
                              (ListView)
                              /       \
                             /         \
                            /           \
                     Selectable        Selectable
                     ("Item 0")         ("Item 1")


 ## Making a widget selectable

 Some leaf widgets, such as [Text], have all of the selection logic wired up
 automatically and can be selected as long as they are under a
 [SelectableRegion].

 To make a custom selectable widget, its render object needs to mix in
 [Selectable] and implement the required APIs to handle [SelectionEvent]s
 as well as paint appropriate selection highlights.

 The render object also needs to register itself to a [SelectionRegistrar].
 For the most cases, one can use [SelectionRegistrant] to auto-register
 itself with the register returned from [SelectionContainer.maybeOf] as
 seen in the example below.

 
 This sample demonstrates how to create an adapter widget that makes any
 child widget selectable.

 ** See code in examples/api/lib/material/selectable_region/selectable_region.0.dart **
 

 ## Complex layout

 By default, the screen order is used as the selection order. If a group of
 [Selectable]s needs to select differently, consider wrapping them with a
 [SelectionContainer] to customize its selection behavior.

 
 This sample demonstrates how to create a [SelectionContainer] that only
 allows selecting everything or nothing with no partial selection.

 ** See code in examples/api/lib/material/selection_container/selection_container.0.dart **
 

 In the case where a group of widgets should be excluded from selection under
 a [SelectableRegion], consider wrapping that group of widgets using
 [SelectionContainer.disabled].

 
 This sample demonstrates how to disable selection for a Text in a Column.

 ** See code in examples/api/lib/material/selection_container/selection_container_disabled.0.dart **
 

 To create a separate selection system from its parent selection area,
 wrap part of the subtree with another [SelectableRegion]. The selection of the
 child selection area can not extend past its subtree, and the selection of
 the parent selection area can not extend inside the child selection area.

 ## Selection status

 A [SelectableRegion]s [SelectableRegionSelectionStatus] is used to indicate whether
 the [SelectableRegion] is actively changing the selection, or has finalized it. For
 example, during a mouse click + drag, the [SelectableRegionSelectionStatus] will be
 set to [SelectableRegionSelectionStatus.changing], and when the mouse click is released
 the status will be set to [SelectableRegionSelectionStatus.finalized].

 The default value of [SelectableRegion]s selection status
 is [SelectableRegionSelectionStatus.finalized].

 To access the [SelectableRegionSelectionStatus] of a parent [SelectableRegion]
 use [SelectableRegionSelectionStatusScope.maybeOf] and retrieve the value from
 the [ValueListenable].

 One can also listen for changes to the [SelectableRegionSelectionStatus] by
 adding a listener to the [ValueListenable] retrieved from [SelectableRegionSelectionStatusScope.maybeOf]
 through [ValueListenable.addListener]. In Stateful widgets this is typically
 done in [State.didChangeDependencies]. Remove the listener when no longer
 needed, typically in your Stateful widgets [State.dispose] method through
 [ValueListenable.removeListener].

 ## Tests

 In a test, a region can be selected either by faking drag events (e.g. using
 [WidgetTester.dragFrom]) or by sending intents to a widget inside the region
 that has been given a [GlobalKey], e.g.:

 ```dart
 Actions.invoke(key.currentContext!, const SelectAllTextIntent(SelectionChangedCause.keyboard));
 ```

 See also:

  * [SelectionArea], which creates a [SelectableRegion] with
    platform-adaptive selection controls.
  * [SelectableText], which enables selection on a single run of text.
  * [SelectionHandler], which contains APIs to handle selection events from the
    [SelectableRegion].
  * [Selectable], which provides API to participate in the selection system.
  * [SelectionRegistrar], which [Selectable] needs to subscribe to receive
    selection events.
  * [SelectionContainer], which collects selectable widgets in the subtree
    and provides api to dispatch selection event to the collected widget.
  * [SelectionListener], which enables accessing the [SelectionDetails] of
    the selectable subtree it wraps.

## Dependencies

- StatefulWidget

## Members

- **magnifierConfiguration**: `TextMagnifierConfiguration`
  The configuration for the magnifier used with selections in this region.

 By default, [SelectableRegion]'s [TextMagnifierConfiguration] is disabled.
 For a version of [SelectableRegion] that adapts automatically to the
 current platform, consider [SelectionArea].

 

- **focusNode**: `FocusNode?`
  

- **child**: `Widget`
  The child widget this selection area applies to.

 

- **contextMenuBuilder**: `SelectableRegionContextMenuBuilder?`
  

- **selectionControls**: `TextSelectionControls`
  The delegate to build the selection handles and toolbar for mobile
 devices.

 The [emptyTextSelectionControls] global variable provides a default
 [TextSelectionControls] implementation with no controls.

- **onSelectionChanged**: `ValueChanged<SelectedContent?>?`
  Called when the selected content changes.

## Constructors

### Unnamed Constructor
Create a new [SelectableRegion] widget.

 The [selectionControls] are used for building the selection handles and
 toolbar for mobile devices.


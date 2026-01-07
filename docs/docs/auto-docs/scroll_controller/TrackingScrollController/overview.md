# Overview for `TrackingScrollController`

## Description

A [ScrollController] whose [initialScrollOffset] tracks its most recently
 updated [ScrollPosition].

 This class can be used to synchronize the scroll offset of two or more
 lazily created scroll views that share a single [TrackingScrollController].
 It tracks the most recently updated scroll position and reports it as its
 `initialScrollOffset`.

 

 In this example each [PageView] page contains a [ListView] and all three
 [ListView]'s share a [TrackingScrollController]. The scroll offsets of all
 three list views will track each other, to the extent that's possible given
 the different list lengths.

 ```dart
 PageView(
   children: <Widget>[
     ListView(
       controller: _trackingScrollController,
       children: List&lt;Widget&gt;.generate(100, (int i) => Text('page 0 item $i')).,
     ),
     ListView(
       controller: _trackingScrollController,
       children: List&lt;Widget&gt;.generate(200, (int i) => Text('page 1 item $i')).,
     ),
     ListView(
      controller: _trackingScrollController,
      children: List&lt;Widget&gt;.generate(300, (int i) => Text('page 2 item $i')).,
     ),
   ],
 )
 ```
 

 In this example the `_trackingController` would have been created by the
 stateful widget that built the widget tree.

## Dependencies

- ScrollController

## Members

- **_positionToListener**: `Map&lt;ScrollPosition, VoidCallback&gt;`
- **_lastUpdated**: `ScrollPosition?`
- **_lastUpdatedOffset**: `double?`
## Constructors

### Unnamed Constructor
Creates a scroll controller that continually updates its
 [initialScrollOffset] to match the last scroll notification it received.


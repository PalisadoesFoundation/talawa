# Overview for `RawGestureDetector`

## Description

A widget that detects gestures described by the given gesture
 factories.

 For common gestures, use a [GestureDetector].
 [RawGestureDetector] is useful primarily when developing your
 own gesture recognizers.

 Configuring the gesture recognizers requires a carefully constructed map, as
 described in [gestures] and as shown in the example below.

 

 This example shows how to hook up a [TapGestureRecognizer]. It assumes that
 the code is being used inside a [State] object with a `_last` field that is
 then displayed as the child of the gesture detector.

 ```dart
 RawGestureDetector(
   gestures: <Type, GestureRecognizerFactory>,
   child: Container(width: 300.0, height: 300.0, color: Colors.yellow, child: Text(_last)),
 )
 ```
 

 See also:

  * [GestureDetector], a less flexible but much simpler widget that does the same thing.
  * [Listener], a widget that reports raw pointer events.
  * [GestureRecognizer], the class that you extend to create a custom gesture recognizer.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **gestures**: `Map&lt;Type, GestureRecognizerFactory&gt;`
  The gestures that this widget will attempt to recognize.

 This should be a map from [GestureRecognizer] subclasses to
 [GestureRecognizerFactory] subclasses specialized with the same type.

 This value can be late-bound at layout time using
 [RawGestureDetectorState.replaceGestureRecognizers].

- **behavior**: `HitTestBehavior?`
  How this gesture detector should behave during hit testing.

 This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
 [HitTestBehavior.translucent] if child is null.

- **excludeFromSemantics**: `bool`
  Whether to exclude these gestures from the semantics tree. For
 example, the long-press gesture for showing a tooltip is
 excluded because the tooltip itself is included in the semantics
 tree directly and so having a gesture to show it would result in
 duplication of information.

- **semantics**: `SemanticsGestureDelegate?`
  Describes the semantics notations that should be added to the underlying
 render object [RenderSemanticsGestureHandler].

 It has no effect if [excludeFromSemantics] is true.

 When [semantics] is null, [RawGestureDetector] will fall back to a
 default delegate which checks if the detector owns certain gesture
 recognizers and calls their callbacks if they exist:

  * During a semantic tap, it calls [TapGestureRecognizer]'s
    `onTapDown`, `onTapUp`, and `onTap`.
  * During a semantic long press, it calls [LongPressGestureRecognizer]'s
    `onLongPressDown`, `onLongPressStart`, `onLongPress`, `onLongPressEnd`
    and `onLongPressUp`.
  * During a semantic horizontal drag, it calls [HorizontalDragGestureRecognizer]'s
    `onDown`, `onStart`, `onUpdate` and `onEnd`, then
    [PanGestureRecognizer]'s `onDown`, `onStart`, `onUpdate` and `onEnd`.
  * During a semantic vertical drag, it calls [VerticalDragGestureRecognizer]'s
    `onDown`, `onStart`, `onUpdate` and `onEnd`, then
    [PanGestureRecognizer]'s `onDown`, `onStart`, `onUpdate` and `onEnd`.

 
 This custom gesture detector listens to force presses, while also allows
 the same callback to be triggered by semantic long presses.

 ```dart
 class ForcePressGestureDetectorWithSemantics extends StatelessWidget 

 class _LongPressSemanticsDelegate extends SemanticsGestureDelegate 
 ```
 

## Constructors

### Unnamed Constructor
Creates a widget that detects gestures.

 Gesture detectors can contribute semantic information to the tree that is
 used by assistive technology. The behavior can be configured by
 [semantics], or disabled with [excludeFromSemantics].


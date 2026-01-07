# Overview for `AnimatedCrossFade`

## Description

A widget that cross-fades between two given children and animates itself
 between their sizes.

 

 The animation is controlled through the [crossFadeState] parameter.
 [firstCurve] and [secondCurve] represent the opacity curves of the two
 children. The [firstCurve] is inverted, i.e. it fades out when providing a
 growing curve like [Curves.linear]. The [sizeCurve] is the curve used to
 animate between the size of the fading-out child and the size of the
 fading-in child.

 This widget is intended to be used to fade a pair of widgets with the same
 width. In the case where the two children have different heights, the
 animation crops overflowing children during the animation by aligning their
 top edge, which means that the bottom will be clipped.

 The animation is automatically triggered when an existing
 [AnimatedCrossFade] is rebuilt with a different value for the
 [crossFadeState] property.

 

 This code fades between two representations of the Flutter logo. It depends
 on a boolean field `_first`; when `_first` is true, the first logo is shown,
 otherwise the second logo is shown. When the field changes state, the
 [AnimatedCrossFade] widget cross-fades between the two forms of the logo
 over three seconds.

 ```dart
 AnimatedCrossFade(
   duration: const Duration(seconds: 3),
   firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
   secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
   crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
 )
 ```
 

 See also:

  * [AnimatedOpacity], which fades between nothing and a single child.
  * [AnimatedSwitcher], which switches out a child for a new one with a
    customizable transition, supporting multiple cross-fades at once.
  * [AnimatedSize], the lower-level widget which [AnimatedCrossFade] uses to
    automatically change size.

## Dependencies

- StatefulWidget

## Members

- **firstChild**: `Widget`
  The child that is visible when [crossFadeState] is
 [CrossFadeState.showFirst]. It fades out when transitioning
 [crossFadeState] from [CrossFadeState.showFirst] to
 [CrossFadeState.showSecond] and vice versa.

- **secondChild**: `Widget`
  The child that is visible when [crossFadeState] is
 [CrossFadeState.showSecond]. It fades in when transitioning
 [crossFadeState] from [CrossFadeState.showFirst] to
 [CrossFadeState.showSecond] and vice versa.

- **crossFadeState**: `CrossFadeState`
  The child that will be shown when the animation has completed.

- **duration**: `Duration`
  The duration of the whole orchestrated animation.

- **reverseDuration**: `Duration?`
  The duration of the whole orchestrated animation when running in reverse.

 If not supplied, this defaults to [duration].

- **firstCurve**: `Curve`
  The fade curve of the first child.

 Defaults to [Curves.linear].

- **secondCurve**: `Curve`
  The fade curve of the second child.

 Defaults to [Curves.linear].

- **sizeCurve**: `Curve`
  The curve of the animation between the two children's sizes.

 Defaults to [Curves.linear].

- **alignment**: `AlignmentGeometry`
  How the children should be aligned while the size is animating.

 Defaults to [Alignment.topCenter].

 See also:

  * [Alignment], a class with convenient constants typically used to
    specify an [AlignmentGeometry].
  * [AlignmentDirectional], like [Alignment] for specifying alignments
    relative to text direction.

- **layoutBuilder**: `AnimatedCrossFadeBuilder`
  A builder that positions the [firstChild] and [secondChild] widgets.

 The widget returned by this method is wrapped in an [AnimatedSize].

 By default, this uses [AnimatedCrossFade.defaultLayoutBuilder], which uses
 a [Stack] and aligns the `bottomChild` to the top of the stack while
 providing the `topChild` as the non-positioned child to fill the provided
 constraints. This works well when the [AnimatedCrossFade] is in a position
 to change size and when the children are not flexible. However, if the
 children are less fussy about their sizes (for example a
 [CircularProgressIndicator] inside a [Center]), or if the
 [AnimatedCrossFade] is being forced to a particular size, then it can
 result in the widgets jumping about when the cross-fade state is changed.

- **excludeBottomFocus**: `bool`
  When true, this is equivalent to wrapping the bottom widget with an [ExcludeFocus]
 widget while it is at the bottom of the cross-fade stack.

 Defaults to true. When it is false, the bottom widget in the cross-fade stack
 can remain in focus until the top widget requests focus. This is useful for
 animating between different [TextField]s so the keyboard remains open during the
 cross-fade animation.

## Constructors

### Unnamed Constructor
Creates a cross-fade animation widget.

 The [duration] of the animation is the same for all components (fade in,
 fade out, and size), and you can pass [Interval]s instead of [Curve]s in
 order to have finer control, e.g., creating an overlap between the fades.


# Overview for `TextMagnifier`

## Description

A [Magnifier] positioned by rules dictated by the native Android magnifier.

 The positioning rules are based on [magnifierInfo], as follows:

 - The loupe tracks the gesture's _x_ coordinate, clamping to the beginning
   and end of the currently editing line.

 - The focal point never contains anything out of the bounds of the text
   field or other widget being magnified (the [MagnifierInfo.fieldBounds]).

 - The focal point always remains aligned with the _y_ coordinate of the touch.

 - The loupe always remains on the screen.

 - When the line targeted by the touch's _y_ coordinate changes, the position
   is animated over [jumpBetweenLinesAnimationDuration].

 This behavior was based on the Android 12 source code, where possible, and
 on eyeballing a Pixel 6 running Android 12 otherwise.

## Dependencies

- StatefulWidget

## Members

- **adaptiveMagnifierConfiguration**: `TextMagnifierConfiguration`
  A [TextMagnifierConfiguration] that returns a [CupertinoTextMagnifier] on
 iOS, [TextMagnifier] on Android, and null on all other platforms, and
 shows the editing handles only on iOS.

- **jumpBetweenLinesAnimationDuration**: `Duration`
  The duration that the position is animated if [TextMagnifier] just switched
 between lines.

- **magnifierInfo**: `ValueNotifier&lt;MagnifierInfo&gt;`
  The current status of the user's touch.

 As the value of the [magnifierInfo] changes, the position of the loupe is
 adjusted automatically, according to the rules described in the
 [TextMagnifier] class description.

## Constructors

### Unnamed Constructor
Creates a [TextMagnifier].

 The [magnifierInfo] must be provided, and must be updated with new values
 as the user's touch changes.


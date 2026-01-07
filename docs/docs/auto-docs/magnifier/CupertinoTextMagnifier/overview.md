# Overview for `CupertinoTextMagnifier`

## Description

A [CupertinoMagnifier] used for magnifying text in cases where a user's
 finger may be blocking the point of interest, like a selection handle.

 
 This sample demonstrates how to use [CupertinoTextMagnifier].

 ** See code in examples/api/lib/widgets/magnifier/cupertino_text_magnifier.0.dart **
 

 Delegates styling to [CupertinoMagnifier] with its position depending on
 [magnifierInfo].

 Specifically, the [CupertinoTextMagnifier] follows the following rules.
 [CupertinoTextMagnifier]:
 - is positioned horizontally inside the screen width, with [horizontalScreenEdgePadding] padding.
 - is hidden if a gesture is detected [hideBelowThreshold] units below the line
   that the magnifier is on, shown otherwise.
 - follows the x coordinate of the gesture directly (with respect to rule 1).
 - has some vertical drag resistance; i.e. if a gesture is detected k units below the field,
   then has vertical offset [dragResistance] * k.

## Dependencies

- StatefulWidget

## Members

- **animationCurve**: `Curve`
  The curve used for the in / out animations.

- **controller**: `MagnifierController`
  This magnifier's controller.

 The [CupertinoTextMagnifier] requires a [MagnifierController]
 in order to show / hide itself without removing itself from the
 overlay.

- **dragResistance**: `double`
  A drag resistance on the downward Y position of the lens.

- **hideBelowThreshold**: `double`
  The difference in Y between the gesture position and the caret center
 so that the magnifier hides itself.

- **horizontalScreenEdgePadding**: `double`
  The padding on either edge of the screen that any part of the magnifier
 cannot exist past.

 This includes any part of the magnifier, not just the center; for example,
 the left edge of the magnifier cannot be outside the [horizontalScreenEdgePadding].v

 If the screen has width w, then the magnifier is bound to
 `_kHorizontalScreenEdgePadding, w - _kHorizontalScreenEdgePadding`.

- **magnifierInfo**: `ValueNotifier&lt;MagnifierInfo&gt;`
  [CupertinoTextMagnifier] will determine its own positioning
 based on the [MagnifierInfo] of this notifier.

- **_kDragAnimationDuration**: `Duration`
  The duration that the magnifier drags behind its final position.

## Constructors

### Unnamed Constructor
Constructs a [RawMagnifier] in the Cupertino style, positioning with respect to
 [magnifierInfo].

 The default constructor parameters and constants were eyeballed on
 an iPhone XR iOS v15.5.


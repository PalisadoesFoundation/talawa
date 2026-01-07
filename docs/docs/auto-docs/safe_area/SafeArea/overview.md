# Overview for `SafeArea`

## Description

A widget that insets its child with sufficient padding to avoid intrusions
 by the operating system.

 

 When a [minimum] padding is specified, the greater of the minimum padding
 or the safe area padding will be applied.

 
 This example shows how `SafeArea` can apply padding within a mobile device's
 screen to make the relevant content completely visible.

 ** See code in examples/api/lib/widgets/safe_area/safe_area.0.dart **
 

 

 This example creates a blue box containing text that is sufficiently padded
 to avoid intrusions by the operating system.

 ```dart
 SafeArea(
   child: Container(
     constraints: const BoxConstraints.,
     alignment: Alignment.center,
     color: Colors.blue,
     child: const Text('Hello, World!'),
   ),
 )
 ```
 

 ### [MediaQuery] impact

 The padding on the [MediaQuery] for the [child] will be suitably adjusted
 to zero out any sides that were avoided by this widget.

 

 See also:

  * [SliverSafeArea], for insetting slivers to avoid operating system
    intrusions.
  * [Padding], for insetting widgets in general.
  * [MediaQuery], from which the view padding is obtained.
  * [dart:ui.FlutterView.padding], which reports the padding from the operating
    system.

## Dependencies

- StatelessWidget

## Members

- **left**: `bool`
  Whether to avoid system intrusions on the left.

- **top**: `bool`
  Whether to avoid system intrusions at the top of the screen, typically the
 system status bar.

- **right**: `bool`
  Whether to avoid system intrusions on the right.

- **bottom**: `bool`
  Whether to avoid system intrusions on the bottom side of the screen.

- **minimum**: `EdgeInsets`
  This minimum padding to apply.

 The greater of the minimum insets and the media padding will be applied.

- **maintainBottomViewPadding**: `bool`
  Specifies whether the [SafeArea] should maintain the bottom
 [MediaQueryData.viewPadding] instead of the bottom [MediaQueryData.padding],
 defaults to false.

 For example, if there is an onscreen keyboard displayed above the
 SafeArea, the padding can be maintained below the obstruction rather than
 being consumed. This can be helpful in cases where your layout contains
 flexible widgets, which could visibly move when opening a software
 keyboard due to the change in the padding value. Setting this to true will
 avoid the UI shift.

- **child**: `Widget`
  The widget below this widget in the tree.

 The padding on the [MediaQuery] for the [child] will be suitably adjusted
 to zero out any sides that were avoided by this widget.

 

## Constructors

### Unnamed Constructor
Creates a widget that avoids operating system interfaces.


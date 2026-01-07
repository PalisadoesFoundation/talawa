# Overview for `SliverSafeArea`

## Description

A sliver that insets another sliver by sufficient padding to avoid
 intrusions by the operating system.

 For example, this will indent the sliver by enough to avoid the status bar
 at the top of the screen.

 It will also indent the sliver by the amount necessary to avoid The Notch
 on the iPhone X, or other similar creative physical features of the
 display.

 When a [minimum] padding is specified, the greater of the minimum padding
 or the safe area padding will be applied.

 See also:

  * [SafeArea], for insetting box widgets to avoid operating system intrusions.
  * [SliverPadding], for insetting slivers in general.
  * [MediaQuery], from which the window padding is obtained.
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

 The greater of the minimum padding and the media padding is be applied.

- **sliver**: `Widget`
  The sliver below this sliver in the tree.

 The padding on the [MediaQuery] for the [sliver] will be suitably adjusted
 to zero out any sides that were avoided by this sliver.

## Constructors

### Unnamed Constructor
Creates a sliver that avoids operating system interfaces.


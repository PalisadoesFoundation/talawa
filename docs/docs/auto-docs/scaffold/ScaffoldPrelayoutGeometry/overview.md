# Overview for `ScaffoldPrelayoutGeometry`

## Description

The geometry of the [Scaffold] after all its contents have been laid out
 except the [FloatingActionButton].

 The [Scaffold] passes this pre-layout geometry to its
 [FloatingActionButtonLocation], which produces an [Offset] that the
 [Scaffold] uses to position the [FloatingActionButton].

 For a description of the [Scaffold]'s geometry after it has
 finished laying out, see the [ScaffoldGeometry].

## Members

- **floatingActionButtonSize**: `Size`
  The [Size] of [Scaffold.floatingActionButton].

 If [Scaffold.floatingActionButton] is null, this will be [Size.zero].

- **bottomSheetSize**: `Size`
  The [Size] of the [Scaffold]'s [BottomSheet].

 If the [Scaffold] is not currently showing a [BottomSheet],
 this will be [Size.zero].

- **contentBottom**: `double`
  The vertical distance from the Scaffold's origin to the bottom of
 [Scaffold.body].

 This is useful in a [FloatingActionButtonLocation] designed to
 place the [FloatingActionButton] at the bottom of the screen, while
 keeping it above the [BottomSheet], the [Scaffold.bottomNavigationBar],
 or the keyboard.

 The [Scaffold.body] is laid out with respect to [minInsets] already. This
 means that a [FloatingActionButtonLocation] does not need to factor in
 [EdgeInsets.bottom] of [minInsets] when aligning a [FloatingActionButton]
 to [contentBottom].

- **contentTop**: `double`
  The vertical distance from the [Scaffold]'s origin to the top of
 [Scaffold.body].

 This is useful in a [FloatingActionButtonLocation] designed to
 place the [FloatingActionButton] at the top of the screen, while
 keeping it below the [Scaffold.appBar].

 The [Scaffold.body] is laid out with respect to [minInsets] already. This
 means that a [FloatingActionButtonLocation] does not need to factor in
 [EdgeInsets.top] of [minInsets] when aligning a [FloatingActionButton] to
 [contentTop].

- **minInsets**: `EdgeInsets`
  The minimum padding to inset the [FloatingActionButton] by for it
 to remain visible.

 This value is the result of calling [MediaQueryData.padding] in the
 [Scaffold]'s [BuildContext],
 and is useful for insetting the [FloatingActionButton] to avoid features like
 the system status bar or the keyboard.

 If [Scaffold.resizeToAvoidBottomInset] is set to false,
 [EdgeInsets.bottom] of [minInsets] will be 0.0.

- **minViewPadding**: `EdgeInsets`
  The minimum padding to inset interactive elements to be within a safe,
 un-obscured space.

 This value reflects the [MediaQueryData.viewPadding] of the [Scaffold]'s
 [BuildContext] when [Scaffold.resizeToAvoidBottomInset] is false or and
 the [MediaQueryData.viewInsets] > 0.0. This helps distinguish between
 different types of obstructions on the screen, such as software keyboards
 and physical device notches.

- **scaffoldSize**: `Size`
  The [Size] of the whole [Scaffold].

 If the [Size] of the [Scaffold]'s contents is modified by values such as
 [Scaffold.resizeToAvoidBottomInset] or the keyboard opening, then the
 [scaffoldSize] will not reflect those changes.

 This means that [FloatingActionButtonLocation]s designed to reposition
 the [FloatingActionButton] based on events such as the keyboard popping
 up should use [minInsets] to make sure that the [FloatingActionButton] is
 inset by enough to remain visible.

 See [minInsets] and [MediaQueryData.padding] for more information on the
 appropriate insets to apply.

- **snackBarSize**: `Size`
  The [Size] of the [Scaffold]'s [SnackBar].

 If the [Scaffold] is not showing a [SnackBar], this will be [Size.zero].

- **materialBannerSize**: `Size`
  The [Size] of the [Scaffold]'s [MaterialBanner].

 If the [Scaffold] is not showing a [MaterialBanner], this will be [Size.zero].

- **textDirection**: `TextDirection`
  The [TextDirection] of the [Scaffold]'s [BuildContext].

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.


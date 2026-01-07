# Overview for `CupertinoPickerDefaultSelectionOverlay`

## Description

A default selection overlay for [CupertinoPicker]s.

 It draws a gray rounded rectangle to match the picker visuals introduced in
 iOS 14.

 This widget is typically only used in [CupertinoPicker.selectionOverlay].
 In an iOS 14 multi-column picker, the selection overlay is a single rounded
 rectangle that spans the entire multi-column picker.
 To achieve the same effect using [CupertinoPickerDefaultSelectionOverlay],
 the additional margin and corner radii on the left or the right side can be
 disabled by turning off [capStartEdge] and [capEndEdge], so this selection
 overlay visually connects with selection overlays of adjoining
 [CupertinoPicker]s (i.e., other "column"s).

 See also:

  * [CupertinoPicker], which uses this widget as its default [CupertinoPicker.selectionOverlay].

## Dependencies

- StatelessWidget

## Members

- **capStartEdge**: `bool`
  Whether to use the default use rounded corners and margin on the start side.

- **capEndEdge**: `bool`
  Whether to use the default use rounded corners and margin on the end side.

- **background**: `Color`
  The color to fill in the background of the [CupertinoPickerDefaultSelectionOverlay].
 It Support for use [CupertinoDynamicColor].

 Typically this should not be set to a fully opaque color, as the currently
 selected item of the underlying [CupertinoPicker] should remain visible.
 Defaults to [CupertinoColors.tertiarySystemFill].

- **_defaultSelectionOverlayHorizontalMargin**: `double`
  Default margin of the 'SelectionOverlay'.

- **_defaultSelectionOverlayRadius**: `double`
  Default radius of the 'SelectionOverlay'.

## Constructors

### Unnamed Constructor
Creates an iOS 14 style selection overlay that highlights the magnified
 area (or the currently selected item, depending on how you described it
 elsewhere) of a [CupertinoPicker].

 The [background] argument default value is
 [CupertinoColors.tertiarySystemFill].

 The [capStartEdge] and [capEndEdge] arguments decide whether to add a
 default margin and use rounded corners on the left and right side of the
 rectangular overlay, and they both default to true.


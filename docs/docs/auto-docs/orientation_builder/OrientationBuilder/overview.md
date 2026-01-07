# Overview for `OrientationBuilder`

## Description

Builds a widget tree that can depend on the parent widget's orientation
 (distinct from the device orientation).

 See also:

  * [LayoutBuilder], which exposes the complete constraints, not just the
    orientation.
  * [CustomSingleChildLayout], which positions its child during layout.
  * [CustomMultiChildLayout], with which you can define the precise layout
    of a list of children during the layout phase.
  * [MediaQueryData.orientation], which exposes whether the device is in
    landscape or portrait mode.

## Dependencies

- StatelessWidget

## Members

- **builder**: `OrientationWidgetBuilder`
  Builds the widgets below this widget given this widget's orientation.

 A widget's orientation is a factor of its width relative to its
 height. For example, a [Column] widget will have a landscape orientation
 if its width exceeds its height, even though it displays its children in
 a vertical array.

## Constructors

### Unnamed Constructor
Creates an orientation builder.


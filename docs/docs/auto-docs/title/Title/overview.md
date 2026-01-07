# Overview for `Title`

## Description

A widget that describes this app in the operating system.

## Dependencies

- StatelessWidget

## Members

- **title**: `String`
  A one-line description of this app for use in the window manager.

- **color**: `Color`
  A color that the window manager should use to identify this app. Must be
 an opaque color (i.e. color.alpha must be 255 (0xFF)), and must not be
 null.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a widget that describes this app to the Android operating system.

 [title] will default to the empty string if not supplied.
 [color] must be an opaque color (i.e. color.alpha must be 255 (0xFF)).
 [color] and [child] are required arguments.


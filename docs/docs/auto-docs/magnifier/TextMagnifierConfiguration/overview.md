# Overview for `TextMagnifierConfiguration`

## Description

A configuration object for a magnifier (e.g. in a text field).

 In general, most features of the magnifier can be configured by controlling
 the widgets built by the [magnifierBuilder].

## Members

- **_magnifierBuilder**: `MagnifierBuilder?`
- **shouldDisplayHandlesInMagnifier**: `bool`
  Whether a magnifier should show the text editing handles or not.

 This flag is used by [SelectionOverlay.showMagnifier] to control the order
 of layers in the rendering; specifically, whether to place the layer
 containing the handles above or below the layer containing the magnifier
 in the [Overlay].

- **disabled**: `TextMagnifierConfiguration`
  A constant for a [TextMagnifierConfiguration] that is disabled, meaning it
 never builds anything, regardless of platform.

## Constructors

### Unnamed Constructor
Constructs a [TextMagnifierConfiguration] from parts.

 If [magnifierBuilder] is null, a default [MagnifierBuilder] will be used
 that does not build a magnifier.


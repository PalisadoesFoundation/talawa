# Overview for `AutomaticNotchedShape`

## Description

A [NotchedShape] created from [ShapeBorder]s.

 Two shapes can be provided. The [host] is the shape of the widget that
 uses the [NotchedShape] (typically a [BottomAppBar]). The [guest] is
 subtracted from the [host] to create the notch (typically to make room
 for a [FloatingActionButton]).

## Dependencies

- NotchedShape

## Members

- **host**: `ShapeBorder`
  The shape of the widget that uses the [NotchedShape] (typically a
 [BottomAppBar]).

 This shape cannot depend on the [TextDirection], as no text direction
 is available to [NotchedShape]s.

- **guest**: `ShapeBorder?`
  The shape to subtract from the [host] to make the notch.

 This shape cannot depend on the [TextDirection], as no text direction
 is available to [NotchedShape]s.

 If this is null, [getOuterPath] ignores the guest rectangle.

## Constructors

### Unnamed Constructor
Creates a [NotchedShape] that is defined by two [ShapeBorder]s.

 The [guest] may be null, in which case no notch is created even
 if a guest rectangle is provided to [getOuterPath].


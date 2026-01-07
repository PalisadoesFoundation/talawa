# Overview for `InputBorder`

## Description

Defines the appearance of an [InputDecorator]'s border.

 An input decorator's border is specified by [InputDecoration.border].

 The border is drawn relative to the input decorator's "container" which
 is the optionally filled area above the decorator's helper, error,
 and counter.

 Input border's are decorated with a line whose weight and color are defined
 by [borderSide]. The input decorator's renderer animates the input border's
 appearance in response to state changes, like gaining or losing the focus,
 by creating new copies of its input border with [copyWith].

 See also:

  * [UnderlineInputBorder], the default [InputDecorator] border which
    draws a horizontal line at the bottom of the input decorator's container.
  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.
  * [InputDecoration], which is used to configure an [InputDecorator].

## Dependencies

- ShapeBorder

## Members

- **none**: `InputBorder`
  No input border.

 Use this value with [InputDecoration.border] to specify that no border
 should be drawn. The [InputDecoration.collapsed] constructor sets
 its border to this value.

- **borderSide**: `BorderSide`
  Defines the border line's color and weight.

 The [InputDecorator] creates copies of its input border, using [copyWith],
 based on the current theme and [InputDecorator.isFocused].

## Constructors

### Unnamed Constructor
Creates a border for an [InputDecorator].

 Applications typically do not specify a [borderSide] parameter because the
 [InputDecorator] substitutes its own, using [copyWith], based on the
 current theme and [InputDecorator.isFocused].


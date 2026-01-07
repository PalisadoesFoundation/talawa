# Overview for `OverflowBar`

## Description

A widget that lays out its [children] in a row unless they
 "overflow" the available horizontal space, in which case it lays
 them out in a column instead.

 This widget's width will expand to contain its children and the
 specified [spacing] until it overflows. The overflow column will
 consume all of the available width. The [overflowAlignment]
 defines how each child will be aligned within the overflow column
 and the [overflowSpacing] defines the gap between each child.

 The order that the children appear in the horizontal layout
 is defined by the [textDirection], just like the [Row] widget.
 If the layout overflows, then children's order within their
 column is specified by [overflowDirection] instead.

 
 This example defines a simple approximation of a dialog
 layout, where the layout of the dialog's action buttons are
 defined by an [OverflowBar]. The content is wrapped in a
 [SingleChildScrollView], so that if overflow occurs, the
 action buttons will still be accessible by scrolling,
 no matter how much vertical space is available.

 ** See code in examples/api/lib/widgets/overflow_bar/overflow_bar.0.dart **
 

## Dependencies

- MultiChildRenderObjectWidget

## Members

- **spacing**: `double`
  The width of the gap between [children] for the default
 horizontal layout.

 If the horizontal layout overflows, then [overflowSpacing] is
 used instead.

 Defaults to 0.0.

- **alignment**: `MainAxisAlignment?`
  Defines the [children]'s horizontal layout according to the same
 rules as for [Row.mainAxisAlignment].

 If this property is non-null, and the [children], separated by
 [spacing], fit within the available width, then the overflow
 bar will be as wide as possible. If the children do not fit
 within the available width, then this property is ignored and
 [overflowAlignment] applies instead.

 If this property is null (the default) then the overflow bar
 will be no wider than needed to layout the [children] separated
 by [spacing], modulo the incoming constraints.

 If [alignment] is one of [MainAxisAlignment.spaceAround],
 [MainAxisAlignment.spaceBetween], or
 [MainAxisAlignment.spaceEvenly], then the [spacing] parameter is
 only used to see if the horizontal layout will overflow.

 Defaults to null.

 See also:

  * [overflowAlignment], the horizontal alignment of the [children] within
    the vertical "overflow" layout.

- **overflowSpacing**: `double`
  The height of the gap between [children] in the vertical
 "overflow" layout.

 This parameter is only used if the horizontal layout overflows, i.e.
 if there isn't enough horizontal room for the [children] and [spacing].

 Defaults to 0.0.

 See also:

  * [spacing], The width of the gap between each pair of children
    for the default horizontal layout.

- **overflowAlignment**: `OverflowBarAlignment`
  The horizontal alignment of the [children] within the vertical
 "overflow" layout.

 This parameter is only used if the horizontal layout overflows, i.e.
 if there isn't enough horizontal room for the [children] and [spacing].
 In that case the overflow bar will expand to fill the available
 width and it will layout its [children] in a column. The
 horizontal alignment of each child within that column is
 defined by this parameter and the [textDirection]. If the
 [textDirection] is [TextDirection.ltr] then each child will be
 aligned with the left edge of the available space for
 [OverflowBarAlignment.start], with the right edge of the
 available space for [OverflowBarAlignment.end]. Similarly, if the
 [textDirection] is [TextDirection.rtl] then each child will
 be aligned with the right edge of the available space for
 [OverflowBarAlignment.start], and with the left edge of the
 available space for [OverflowBarAlignment.end]. For
 [OverflowBarAlignment.center] each child is horizontally
 centered within the available space.

 Defaults to [OverflowBarAlignment.start].

 See also:

  * [alignment], which defines the [children]'s horizontal layout
    (according to the same rules as for [Row.mainAxisAlignment]) when
    the children, separated by [spacing], fit within the available space.
  * [overflowDirection], which defines the order that the
    [OverflowBar]'s children appear in, if the horizontal layout
    overflows.

- **overflowDirection**: `VerticalDirection`
  Defines the order that the [children] appear in, if
 the horizontal layout overflows.

 This parameter is only used if the horizontal layout overflows, i.e.
 if there isn't enough horizontal room for the [children] and [spacing].

 If the children do not fit into a single row, then they
 are arranged in a column. The first child is at the top of the
 column if this property is set to [VerticalDirection.down], since it
 "starts" at the top and "ends" at the bottom. On the other hand,
 the first child will be at the bottom of the column if this
 property is set to [VerticalDirection.up], since it "starts" at the
 bottom and "ends" at the top.

 Defaults to [VerticalDirection.down].

 See also:

  * [overflowAlignment], which defines the horizontal alignment
    of the children within the vertical "overflow" layout.

- **textDirection**: `TextDirection?`
  Determines the order that the [children] appear in for the default
 horizontal layout, and the interpretation of
 [OverflowBarAlignment.start] and [OverflowBarAlignment.end] for
 the vertical overflow layout.

 For the default horizontal layout, if [textDirection] is
 [TextDirection.rtl] then the last child is laid out first. If
 [textDirection] is [TextDirection.ltr] then the first child is
 laid out first.

 If this parameter is null, then the value of
 `Directionality.of(context)` is used.

 See also:

  * [overflowDirection], which defines the order that the
    [OverflowBar]'s children appear in, if the horizontal layout
    overflows.
  * [Directionality], which defines the ambient directionality of
    text and text-direction-sensitive render objects.

## Constructors

### Unnamed Constructor
Constructs an OverflowBar.


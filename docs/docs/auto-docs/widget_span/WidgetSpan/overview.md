# Overview for `WidgetSpan`

## Description

An immutable widget that is embedded inline within text.

 The [child] property is the widget that will be embedded. Children are
 constrained by the width of the paragraph.

 The [child] property may contain its own [Widget] children (if applicable),
 including [Text] and [RichText] widgets which may include additional
 [WidgetSpan]s. Child [Text] and [RichText] widgets will be laid out
 independently and occupy a rectangular space in the parent text layout.

 [WidgetSpan]s will be ignored when passed into a [TextPainter] directly.
 To properly layout and paint the [child] widget, [WidgetSpan] should be
 passed into a [Text.rich] widget.

 

 A card with `Hello World!` embedded inline within a TextSpan tree.

 ```dart
 const Text.rich(
   TextSpan(
     children: <InlineSpan>[
       TextSpan(text: 'Flutter is'),
       WidgetSpan(
         child: SizedBox(
           width: 120,
           height: 50,
           child: Card(
             child: Center(
               child: Text('Hello World!')
             )
           ),
         )
       ),
       TextSpan(text: 'the best!'),
     ],
   )
 )
 ```
 

 [WidgetSpan] contributes the semantics of the [WidgetSpan.child] to the
 semantics tree.

 See also:

  * [TextSpan], a node that represents text in an [InlineSpan] tree.
  * [Text], a widget for showing uniformly-styled text.
  * [RichText], a widget for finer control of text rendering.
  * [TextPainter], a class for painting [InlineSpan] objects on a [Canvas].

## Dependencies

- PlaceholderSpan

## Members

- **child**: `Widget`
  The widget to embed inline within text.

## Constructors

### Unnamed Constructor
Creates a [WidgetSpan] with the given values.

 [WidgetSpan] is a leaf node in the [InlineSpan] tree. Child widgets are
 constrained by the width of the paragraph they occupy. Child widget
 heights are unconstrained, and may cause the text to overflow and be
 ellipsized/truncated.

 A [TextStyle] may be provided with the [style] property, but only the
 decoration, foreground, background, and spacing options will be used.


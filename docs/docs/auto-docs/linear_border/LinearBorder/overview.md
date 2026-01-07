# Overview for `LinearBorder`

## Description

An [OutlinedBorder] like [BoxBorder] that allows one to define a rectangular (box) border
 in terms of zero to four [LinearBorderEdge]s, each of which is rendered as a single line.

 The color and width of each line are defined by [side]. When [LinearBorder] is used
 with a class whose border sides and shape are defined by a [ButtonStyle], then a non-null
 [ButtonStyle.side] will override the one specified here. For example the [LinearBorder]
 in the [TextButton] example below adds a red underline to the button. This is because
 TextButton's `side` parameter overrides the `side` property of its [ButtonStyle.shape].

 ```dart
  TextButton(
    style: TextButton.styleFrom(
      side: const BorderSide(color: Colors.red),
      shape: const LinearBorder(
        side: BorderSide(color: Colors.blue),
        bottom: ,
      ),
    ),
    onPressed:  ,
    child: const Text('Red LinearBorder'),
  )
```

 This class resolves itself against the current [TextDirection] (see [Directionality]).
 Start and end values resolve to left and right for [TextDirection.ltr] and to
 right and left for [TextDirection.rtl].

 Convenience constructors are included for the common case where just one edge is specified:
 [LinearBorder.start], [LinearBorder.end], [LinearBorder.top], [LinearBorder.bottom].

 
 This example shows how to draw different kinds of [LinearBorder]s.

 ** See code in examples/api/lib/painting/linear_border/linear_border.0.dart **
 

## Dependencies

- OutlinedBorder

## Members

- **none**: `LinearBorder`
  No border.

- **start**: `LinearBorderEdge?`
  Defines the left edge for [TextDirection.ltr] or the right
 for [TextDirection.rtl].

- **end**: `LinearBorderEdge?`
  Defines the right edge for [TextDirection.ltr] or the left
 for [TextDirection.rtl].

- **top**: `LinearBorderEdge?`
  Defines the top edge.

- **bottom**: `LinearBorderEdge?`
  Defines the bottom edge.

## Constructors

### Unnamed Constructor
Creates a rectangular box border that's rendered as zero to four lines.

### start
Creates a rectangular box border with an edge on the left for [TextDirection.ltr]
 or on the right for [TextDirection.rtl].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### end
Creates a rectangular box border with an edge on the right for [TextDirection.ltr]
 or on the left for [TextDirection.rtl].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### top
Creates a rectangular box border with an edge on the top.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### bottom
Creates a rectangular box border with an edge on the bottom.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

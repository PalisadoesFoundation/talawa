# Overview for `TableBorder`

## Description

Border specification for [Table] widgets.

 This is like [Border], with the addition of two sides: the inner horizontal
 borders between rows and the inner vertical borders between columns.

 The sides are represented by [BorderSide] objects.

## Members

- **top**: `BorderSide`
  The top side of this border.

- **right**: `BorderSide`
  The right side of this border.

- **bottom**: `BorderSide`
  The bottom side of this border.

- **left**: `BorderSide`
  The left side of this border.

- **horizontalInside**: `BorderSide`
  The horizontal interior sides of this border.

- **verticalInside**: `BorderSide`
  The vertical interior sides of this border.

- **borderRadius**: `BorderRadius`
  The [BorderRadius] to use when painting the corners of this border.

 It is also applied to [DataTable]'s [Material].

## Constructors

### Unnamed Constructor
Creates a border for a table.

 All the sides of the border default to [BorderSide.none].

### all
A uniform border with all sides the same color and width.

 The sides default to black solid borders, one logical pixel wide.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### symmetric
Creates a border for a table where all the interior sides use the same
 styling and all the exterior sides use the same styling.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

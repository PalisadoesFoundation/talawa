# Overview for `Border`

## Description

A border of a box, comprised of four sides: top, right, bottom, left.

 The sides are represented by [BorderSide] objects.

 

 All four borders the same, two-pixel wide solid white:

 ```dart
 Border.all(width: 2.0, color: const Color(0xFFFFFFFF))
 ```
 
 

 The border for a Material Design divider:

 ```dart
 Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
 ```
 
 

 A 1990s-era "OK" button:

 ```dart
 Container(
   decoration: const BoxDecoration(
     border: Border(
       top: BorderSide(color: Color(0xFFFFFFFF)),
       left: BorderSide(color: Color(0xFFFFFFFF)),
       right: ,
       bottom: ,
     ),
   ),
   child: Container(
     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
     decoration: const BoxDecoration(
       border: Border(
         top: BorderSide(color: Color(0xFFDFDFDF)),
         left: BorderSide(color: Color(0xFFDFDFDF)),
         right: BorderSide(color: Color(0xFF7F7F7F)),
         bottom: BorderSide(color: Color(0xFF7F7F7F)),
       ),
       color: Color(0xFFBFBFBF),
     ),
     child: const Text(
       'OK',
       textAlign: TextAlign.center,
       style: TextStyle(color: Color(0xFF000000))
     ),
   ),
 )
 ```
 

 See also:

  * [BoxDecoration], which uses this class to describe its edge decoration.
  * [BorderSide], which is used to describe each side of the box.
  * [Theme], from the material layer, which can be queried to obtain appropriate colors
    to use for borders in a [MaterialApp], as shown in the "divider" sample above.
  * [paint], which explains the behavior of [BoxDecoration] parameters.
  * <https://pub.dev/packages/non_uniform_border>, a package that implements
    a Non-Uniform Border on ShapeBorder, which is used by Material Design
    buttons and other widgets, under the "shape" field.

## Dependencies

- BoxBorder

## Members

- **top**: `BorderSide`
- **right**: `BorderSide`
  The right side of this border.

- **bottom**: `BorderSide`
- **left**: `BorderSide`
  The left side of this border.

## Constructors

### Unnamed Constructor
Creates a border.

 All the sides of the border default to [BorderSide.none].

### fromBorderSide
Creates a border whose sides are all the same.

#### Parameters

- `side`: `BorderSide`
### symmetric
Creates a border with symmetrical vertical and horizontal sides.

 The `vertical` argument applies to the [left] and [right] sides, and the
 `horizontal` argument applies to the [top] and [bottom] sides.

 All arguments default to [BorderSide.none].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### all
A uniform border with all sides the same color and width.

 The sides default to black solid borders, one logical pixel wide.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

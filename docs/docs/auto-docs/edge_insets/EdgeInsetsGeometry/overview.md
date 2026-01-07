# Overview for `EdgeInsetsGeometry`

## Description

Base class for [EdgeInsets] that allows for text-direction aware
 resolution.

 A property or argument of this type accepts classes created either with [
 EdgeInsets.fromLTRB] and its variants, or [
 EdgeInsetsDirectional.fromSTEB] and its variants.

 To convert an [EdgeInsetsGeometry] object of indeterminate type into a
 [EdgeInsets] object, call the [resolve] method.

 See also:

  * [Padding], a widget that describes margins using [EdgeInsetsGeometry].

## Members

- **zero**: `EdgeInsetsGeometry`
  An [EdgeInsets] with zero offsets in each direction.

- **infinity**: `EdgeInsetsGeometry`
  An [EdgeInsetsGeometry] with infinite offsets in each direction.

 Can be used as an infinite upper bound for [clamp].

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### all
Creates insets where all the offsets are `value`.

#### Parameters

- `value`: `double`
### only
Creates [EdgeInsets] with only the given values non-zero.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### directional
Creates [EdgeInsetsDirectional] with only the given values non-zero.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### symmetric
Creates [EdgeInsets] with symmetrical vertical and horizontal offsets.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### fromLTRB
Creates [EdgeInsets] from offsets from the left, top, right, and bottom.

#### Parameters

- `left`: `double`
- `top`: `double`
- `right`: `double`
- `bottom`: `double`
### fromViewPadding
Creates [EdgeInsets] that match the given view padding.

 If you need the current system padding or view insets in the context of a
 widget, consider using [MediaQuery.paddingOf] to obtain these values
 rather than using the value from a [FlutterView] directly, so that you get
 notified of changes.

#### Parameters

- `padding`: `ui.ViewPadding`
- `devicePixelRatio`: `double`
### fromSTEB
Creates [EdgeInsetsDirectional] from offsets from the start, top, end, and
 bottom.

#### Parameters

- `start`: `double`
- `top`: `double`
- `end`: `double`
- `bottom`: `double`

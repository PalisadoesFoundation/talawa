# Method: `removePadding`

## Description

Creates a copy of this media query data but with the given [padding]s
 replaced with zero.

 If all four of the `removeLeft`, `removeTop`, `removeRight`, and
 `removeBottom` arguments are false (the default), then this
 [MediaQueryData] is returned unmodified.

 See also:

  * [MediaQuery.removePadding], which uses this method to remove [padding]
    from the ambient [MediaQuery].
  * [SafeArea], which both removes the padding from the [MediaQuery] and
    adds a [Padding] widget.
  * [removeViewInsets], the same thing but for [viewInsets].
  * [removeViewPadding], the same thing but for [viewPadding].

## Return Type
`MediaQueryData`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

# Method: `hasInfiniteHeight`

## Description

Whether the height constraint is infinite.

 Such a constraint is used to indicate that a box should grow as large as
 some other constraint (in this case, vertically). If constraints are
 infinite, then they must have other (non-infinite) constraints [enforce]d
 upon them, or must be [tighten]ed, before they can be used to derive a
 [Size] for a [RenderBox.size].

 See also:

  * [hasInfiniteWidth], the equivalent for the horizontal axis.
  * [hasBoundedHeight], which describes whether the maximum height
    constraint is finite.

## Return Type
`bool`


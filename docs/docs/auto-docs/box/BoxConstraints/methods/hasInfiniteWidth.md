# Method: `hasInfiniteWidth`

## Description

Whether the width constraint is infinite.

 Such a constraint is used to indicate that a box should grow as large as
 some other constraint (in this case, horizontally). If constraints are
 infinite, then they must have other (non-infinite) constraints [enforce]d
 upon them, or must be [tighten]ed, before they can be used to derive a
 [Size] for a [RenderBox.size].

 See also:

  * [hasInfiniteHeight], the equivalent for the vertical axis.
  * [hasBoundedWidth], which describes whether the maximum width
    constraint is finite.

## Return Type
`bool`


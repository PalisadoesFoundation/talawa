# Overview for `SliverOffstage`

## Description

A sliver that lays its sliver child out as if it was in the tree, but
 without painting anything, without making the sliver child available for hit
 testing, and without taking any room in the parent.

 Animations continue to run in offstage sliver children, and therefore use
 battery and CPU time, regardless of whether the animations end up being
 visible.

 To hide a sliver widget from view while it is
 not needed, prefer removing the widget from the tree entirely rather than
 keeping it alive in an [Offstage] subtree.

 See also:

  * [Offstage], the equivalent widget for boxes.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **offstage**: `bool`
  Whether the sliver child is hidden from the rest of the tree.

 If true, the sliver child is laid out as if it was in the tree, but
 without painting anything, without making the child available for hit
 testing, and without taking any room in the parent.

 If false, the sliver child is included in the tree as normal.

## Constructors

### Unnamed Constructor
Creates a sliver that visually hides its sliver child.


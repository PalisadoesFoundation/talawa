# Overview for `SliverIgnorePointer`

## Description

A sliver widget that is invisible during hit testing.

 When [ignoring] is true, this widget (and its subtree) is invisible
 to hit testing. It still consumes space during layout and paints its sliver
 child as usual. It just cannot be the target of located events, because it
 returns false from [RenderSliver.hitTest].

 ## Semantics

 Using this class may also affect how the semantics subtree underneath is
 collected.

 

 

 See also:

  * [IgnorePointer], the equivalent widget for boxes.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **ignoring**: `bool`
  Whether this sliver is ignored during hit testing.

 Regardless of whether this sliver is ignored during hit testing, it will
 still consume space during layout and be visible during painting.

 

- **ignoringSemantics**: `bool?`
  Whether the semantics of this sliver is ignored when compiling the
 semantics tree.

 

## Constructors

### Unnamed Constructor
Creates a sliver widget that is invisible to hit testing.


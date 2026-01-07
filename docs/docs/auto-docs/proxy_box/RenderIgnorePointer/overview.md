# Overview for `RenderIgnorePointer`

## Description

A render object that is invisible during hit testing.

 When [ignoring] is true, this render object (and its subtree) is invisible
 to hit testing. It still consumes space during layout and paints its child
 as usual. It just cannot be the target of located events, because its render
 object returns false from [hitTest].

 ## Semantics

 Using this class may also affect how the semantics subtree underneath is
 collected.

 

 

 See also:

  * [RenderAbsorbPointer], which takes the pointer events but prevents any
    nodes in the subtree from seeing them.

## Dependencies

- RenderProxyBox

## Members

- **_ignoring**: `bool`
- **_ignoringSemantics**: `bool?`
## Constructors

### Unnamed Constructor
Creates a render object that is invisible to hit testing.


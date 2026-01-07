# Overview for `RenderAbsorbPointer`

## Description

A render object that absorbs pointers during hit testing.

 When [absorbing] is true, this render object prevents its subtree from
 receiving pointer events by terminating hit testing at itself. It still
 consumes space during layout and paints its child as usual. It just prevents
 its children from being the target of located events, because its render
 object returns true from [hitTest].

 ## Semantics

 Using this class may also affect how the semantics subtree underneath is
 collected.

 

 

 See also:

  * [RenderIgnorePointer], which has the opposite effect: removing the
    subtree from considering entirely for the purposes of hit testing.

## Dependencies

- RenderProxyBox

## Members

- **_absorbing**: `bool`
- **_ignoringSemantics**: `bool?`
## Constructors

### Unnamed Constructor
Creates a render object that absorbs pointers during hit testing.


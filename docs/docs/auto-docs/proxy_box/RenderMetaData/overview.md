# Overview for `RenderMetaData`

## Description

Holds opaque meta data in the render tree.

 Useful for decorating the render tree with information that will be consumed
 later. For example, you could store information in the render tree that will
 be used when the user interacts with the render tree but has no visual
 impact prior to the interaction.

## Dependencies

- RenderProxyBoxWithHitTestBehavior

## Members

- **metaData**: `dynamic`
  Opaque meta data ignored by the render tree.

## Constructors

### Unnamed Constructor
Creates a render object that hold opaque meta data.

 The [behavior] argument defaults to [HitTestBehavior.deferToChild].


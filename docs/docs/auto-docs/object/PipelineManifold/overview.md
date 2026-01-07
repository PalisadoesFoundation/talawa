# Overview for `PipelineManifold`

## Description

Manages a tree of [PipelineOwner]s.

 All [PipelineOwner]s within a tree are attached to the same
 [PipelineManifold], which gives them access to shared functionality such
 as requesting a visual update (by calling [requestVisualUpdate]). As such,
 the [PipelineManifold] gives the [PipelineOwner]s access to functionality
 usually provided by the bindings without tying the [PipelineOwner]s to a
 particular binding implementation.

 The root of the [PipelineOwner] tree is attached to a [PipelineManifold] by
 passing the manifold to [PipelineOwner.attach]. Children are attached to the
 same [PipelineManifold] as their parent when they are adopted via
 [PipelineOwner.adoptChild].

 [PipelineOwner]s can register listeners with the [PipelineManifold] to be
 informed when certain values provided by the [PipelineManifold] change.

## Dependencies

- Listenable


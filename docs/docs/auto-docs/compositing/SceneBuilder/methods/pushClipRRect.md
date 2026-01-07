# Method: `pushClipRRect`

## Description

Pushes a rounded-rectangular clip operation onto the operation stack.

 Rasterization outside the given rounded rectangle is discarded.

 

 

 See [pop] for details about the operation stack, and [Clip] for different clip modes.
 By default, the clip will be anti-aliased (clip = [Clip.antiAlias]).

## Return Type
`ClipRRectEngineLayer`

## Parameters

- `rrect`: `RRect`
- ``: `dynamic`
- ``: `dynamic`

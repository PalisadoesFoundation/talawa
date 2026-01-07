# Method: `nodesNeedingPaint`

## Description

The [RenderObject]s which need to be painted in the next [flushPaint] pass.

 [RenderObject]s marked with [RenderObject.isRepaintBoundary] are added
 when they are marked needing paint. Subclasses of [PipelineOwner] may use them
 to invalidate caches or otherwise make performance optimizations.
 Since nodes may be marked for layout at any time, they are best checked during
 [flushPaint].

 Marked children of child [PipelineOwner]s are not included here.

## Return Type
`Iterable&lt;RenderObject&gt;`


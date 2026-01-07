# Method: `nodesNeedingLayout`

## Description

The [RenderObject]s representing relayout boundaries which need to be laid out
 in the next [flushLayout] pass.

 Relayout boundaries are added when they are marked for layout.
 Subclasses of [PipelineOwner] may use them to invalidate caches or
 otherwise make performance optimizations. Since nodes may be marked for
 layout at any time, they are best checked during [flushLayout].

 Relayout boundaries owned by child [PipelineOwner]s are not included here.

 Boundaries appear in an arbitrary order, and may appear multiple times.

## Return Type
`Iterable&lt;RenderObject&gt;`


# Method: `dispose`

## Description

Release any resources held by this pipeline owner.

 Prior to calling this method the pipeline owner must be removed from the
 pipeline owner tree, i.e. it must have neither a parent nor any children
 (see [dropChild]). It also must be [detach]ed from any [PipelineManifold].

 The object is no longer usable after calling dispose.

## Return Type
`void`


# Method: `markNeedsLayout`

## Description

Mark this render object's layout information as dirty, and either register
 this object with its [PipelineOwner], or defer to the parent, depending on
 whether this object is a relayout boundary or not respectively.

 ## Background

 Rather than eagerly updating layout information in response to writes into
 a render object, we instead mark the layout information as dirty, which
 schedules a visual update. As part of the visual update, the rendering
 pipeline updates the render object's layout information.

 This mechanism batches the layout work so that multiple sequential writes
 are coalesced, removing redundant computation.

 If a render object's parent indicates that it uses the size of one of its
 render object children when computing its layout information, this
 function, when called for the child, will also mark the parent as needing
 layout. In that case, since both the parent and the child need to have
 their layout recomputed, the pipeline owner is only notified about the
 parent; when the parent is laid out, it will call the child's [layout]
 method and thus the child will be laid out as well.

 Once [markNeedsLayout] has been called on a render object,
 [debugNeedsLayout] returns true for that render object until just after
 the pipeline owner has called [layout] on the render object.

 ## Special cases

 Some subclasses of [RenderObject], notably [RenderBox], have other
 situations in which the parent needs to be notified if the child is
 dirtied (e.g., if the child's intrinsic dimensions or baseline changes).
 Such subclasses override markNeedsLayout and either call
 `super.`, in the normal case, or call
 [markParentNeedsLayout], in the case where the parent needs to be laid out
 as well as the child.

 If [sizedByParent] has changed, calls
 [markNeedsLayoutForSizedByParentChange] instead of [markNeedsLayout].

## Return Type
`void`


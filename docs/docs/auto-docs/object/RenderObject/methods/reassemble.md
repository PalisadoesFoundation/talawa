# Method: `reassemble`

## Description

Cause the entire subtree rooted at the given [RenderObject] to be marked
 dirty for layout, paint, etc, so that the effects of a hot reload can be
 seen, or so that the effect of changing a global debug flag (such as
 [debugPaintSizeEnabled]) can be applied.

 This is called by the [RendererBinding] in response to the
 `ext.flutter.reassemble` hook, which is used by development tools when the
 application code has changed, to cause the widget tree to pick up any
 changed implementations.

 This is expensive and should not be called except during development.

 See also:

  * [BindingBase.reassembleApplication]

## Return Type
`void`


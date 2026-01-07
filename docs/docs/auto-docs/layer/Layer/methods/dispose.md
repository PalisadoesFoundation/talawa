# Method: `dispose`

## Description

Clears any retained resources that this layer holds.

 This method must dispose resources such as [ui.EngineLayer] and [ui.Picture]
 objects. The layer is still usable after this call, but any graphics
 related resources it holds will need to be recreated.

 This method _only_ disposes resources for this layer. For example, if it
 is a [ContainerLayer], it does not dispose resources of any children.
 However, [ContainerLayer]s do remove any children they have when
 this method is called, and if this layer was the last holder of a removed
 child handle, the child may recursively clean up its resources.

 This method automatically gets called when all outstanding [LayerHandle]s
 are disposed. [LayerHandle] objects are typically held by the [parent]
 layer of this layer and any [RenderObject]s that participated in creating
 it.

 After calling this method, the object is unusable.

## Return Type
`void`


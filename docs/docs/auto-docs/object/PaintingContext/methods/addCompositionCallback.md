# Method: `addCompositionCallback`

## Description

Adds a [CompositionCallback] for the current [ContainerLayer] used by this
 context.

 Composition callbacks are called whenever the layer tree containing the
 current layer of this painting context gets composited, or when it gets
 detached and will not be rendered again. This happens regardless of
 whether the layer is added via retained rendering or not.

 

 See also:
   *  [Layer.addCompositionCallback].

## Return Type
`VoidCallback`

## Parameters

- `callback`: `CompositionCallback`

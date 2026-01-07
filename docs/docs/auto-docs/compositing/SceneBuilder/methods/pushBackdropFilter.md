# Method: `pushBackdropFilter`

## Description

Pushes a backdrop filter operation onto the operation stack.

 The given filter is applied to the current contents of the scene as far back as
 the most recent save layer and rendered back to the scene using the indicated
 [blendMode] prior to rasterizing the child layers.

 If [backdropId] is provided and not null, then this value is treated
 as a unique identifier for the backdrop. When the first backdrop filter with
 a given id is processed during rasterization, the state of the backdrop is
 recorded and cached. All subsequent backdrop filters with the same identifier
 will apply their filter to the cached backdrop. The correct usage of the
 backdrop id has the benefit of dramatically improving performance for
 applications with multiple backdrop filters. For example, an application
 that uses a backdrop blur filter for each item in a list view should set
 all filters to have the same backdrop id.

 If overlapping backdrop filters use the same backdropId, then each filter
 will apply to the backdrop before the overlapping filter components were
 rendered.

 

 

 See [pop] for details about the operation stack.

## Return Type
`BackdropFilterEngineLayer`

## Parameters

- `filter`: `ImageFilter`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

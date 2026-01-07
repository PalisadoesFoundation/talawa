# Method: `addPicture`

## Description

Adds a [Picture] to the scene.

 The picture is rasterized at the given `offset`.

 The rendering _may_ be cached to reduce the cost of painting the picture
 if it is reused in subsequent frames. Whether a picture is cached or not
 depends on the backend implementation. When caching is considered, the
 choice to cache or not cache is a heuristic based on how often the picture
 is being painted and the cost of painting the picture. To disable this
 caching, set `willChangeHint` to true. To force the caching to happen (in
 backends that do caching), set `isComplexHint` to true. When both are set,
 `willChangeHint` prevails.

 In general, setting these hints is not very useful. Backends that cache
 pictures only do so for pictures that have been rendered three times
 already; setting `willChangeHint` to true to avoid caching an animating
 picture that changes every frame is therefore redundant, the picture
 wouldn't have been cached anyway. Similarly, backends that cache pictures
 are relatively aggressive about doing so, such that any image complicated
 enough to warrant caching is probably already being cached even without
 `isComplexHint` being set to true.

## Return Type
`void`

## Parameters

- `offset`: `Offset`
- `picture`: `Picture`
- ``: `dynamic`
- ``: `dynamic`

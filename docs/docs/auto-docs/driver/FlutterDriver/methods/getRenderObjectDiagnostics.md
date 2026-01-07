# Method: `getRenderObjectDiagnostics`

## Description

Returns a JSON map of the [DiagnosticsNode] that is associated with the
 [RenderObject] identified by `finder`.

 The `subtreeDepth` argument controls how many layers of children will be
 included in the result. It defaults to zero, which means that no children
 of the [RenderObject] identified by `finder` will be part of the result.

 The `includeProperties` argument controls whether properties of the
 [DiagnosticsNode]s will be included in the result. It defaults to true.

 [RenderObject]s are responsible for positioning, layout, and painting on
 the screen, based on the configuration from a [Widget]. Callers that need
 information about size or position should use this method.

 A widget may indirectly create multiple [RenderObject]s, which each
 implement some aspect of the widget configuration. A 1:1 relationship
 should not be assumed.

 See also:

  * [getWidgetDiagnostics], which gets the [DiagnosticsNode] of a [Widget].

## Return Type
`Future<Map&lt;String, Object?&gt;>`

## Parameters

- `finder`: `SerializableFinder`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

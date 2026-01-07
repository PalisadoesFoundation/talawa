# Method: `getWidgetDiagnostics`

## Description

Returns a JSON map of the [DiagnosticsNode] that is associated with the
 [Widget] identified by `finder`.

 The `subtreeDepth` argument controls how many layers of children will be
 included in the result. It defaults to zero, which means that no children
 of the [Widget] identified by `finder` will be part of the result.

 The `includeProperties` argument controls whether properties of the
 [DiagnosticsNode]s will be included in the result. It defaults to true.

 [Widget]s describe configuration for the rendering tree. Individual
 widgets may create multiple [RenderObject]s to actually layout and paint
 the desired configuration.

 See also:

  * [getRenderObjectDiagnostics], which gets the [DiagnosticsNode] of a
    [RenderObject].

## Return Type
`Future<Map&lt;String, Object?&gt;>`

## Parameters

- `finder`: `SerializableFinder`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

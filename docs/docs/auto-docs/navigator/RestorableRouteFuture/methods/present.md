# Method: `present`

## Description

Shows the route created by [onPresent] and invoke [onComplete] when it
 completes.

 The `arguments` object is passed to [onPresent] and can be used to
 customize the route. It must be serializable via the
 [StandardMessageCodec]. Often, a [Map] is used to pass key-value pairs.

## Return Type
`void`

## Parameters

- ``: `dynamic`

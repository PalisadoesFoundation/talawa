# Method: `invokeCallback`

## Description

Invoke a callback provided by the application, catching and logging any
 exceptions.

 The `name` argument is ignored except when reporting exceptions.

 The `debugReport` argument is optional and is used when
 [debugPrintRecognizerCallbacksTrace] is true. If specified, it must be a
 callback that returns a string describing useful debugging information,
 e.g. the arguments passed to the callback.

## Return Type
`T?`

## Parameters

- `name`: `String`
- `callback`: `RecognizerCallback&lt;T&gt;`
- ``: `dynamic`

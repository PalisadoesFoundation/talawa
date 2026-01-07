# Method: `run`

## Description

Runs the given [callback] asynchronously as soon as possible.

 This function is equivalent to `new Timer(Duration.zero, callback)`.

 Example:
 ```dart
 Timer.run( => print('timer run'));
 ```

## Return Type
`void`

## Parameters

- `callback`: `void `

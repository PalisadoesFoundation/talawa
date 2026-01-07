# Method: `timeSync`

## Description

A utility method to time a synchronous `function`. Internally calls
 `function` bracketed by calls to [startSync] and [finishSync].

 This is a drop-in replacement for [Timeline.timeSync].

## Return Type
`T`

## Parameters

- `name`: `String`
- `function`: `TimelineSyncFunction&lt;T&gt;`
- ``: `dynamic`
- ``: `dynamic`

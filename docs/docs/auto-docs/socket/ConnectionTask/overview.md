# Overview for `ConnectionTask`

## Description

A cancelable connection attempt.

 Returned by the `startConnect` methods on client-side socket types `S`,
 `ConnectionTask&lt;S&gt;` allows canceling an attempt to connect to a host.

## Members

- **socket**: `Future&lt;S&gt;`
  A `Future` that completes with value that `S.` would return
 unless [cancel] is called on this [ConnectionTask].

 If [cancel] is called, the future completes with a [SocketException]
 error whose message indicates that the connection attempt was cancelled.

- **_onCancel**: `void `
## Constructors

### _


#### Parameters

- `socket`: `Future&lt;S&gt;`
- `onCancel`: `void `

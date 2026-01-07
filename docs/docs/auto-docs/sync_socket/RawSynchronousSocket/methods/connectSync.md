# Method: `connectSync`

## Description

Creates a new socket connection and returns a [RawSynchronousSocket].

 The [host] can either be a [String] or an [InternetAddress].
 If [host] is a [String], [connectSync] will perform a
 [InternetAddress.lookup] and try all returned [InternetAddress]es,
 until connected.
 Unless a connection was established,
 the error from the first failing connection is returned.

## Return Type
`RawSynchronousSocket`

## Parameters

- `host`: `dynamic`
- `port`: `int`

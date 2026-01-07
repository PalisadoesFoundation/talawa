# Overview for `CallbackHandle`

## Description

A wrapper for a raw callback handle.

 This is the return type for [PluginUtilities.getCallbackHandle].

## Members

- **_handle**: `int`
## Constructors

### fromRawHandle
Create an instance using a raw callback handle.

 Only values produced by a call to [CallbackHandle.toRawHandle] should be
 used, otherwise this object will be an invalid handle.

#### Parameters

- `_handle`: `dynamic`

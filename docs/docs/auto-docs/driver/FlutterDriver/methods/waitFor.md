# Method: `waitFor`

## Description

Waits until [finder] locates the target.

 The [finder] will wait until there is no pending frame scheduled
 in the app under test before executing an action.

 See also:

  * [FlutterDriver.runUnsynchronized], which will execute an action
    with frame sync disabled even while frames are pending.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `finder`: `SerializableFinder`
- ``: `dynamic`

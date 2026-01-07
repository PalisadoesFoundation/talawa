# Method: `runUnsynchronized`

## Description

[action] will be executed with the frame sync mechanism disabled.

 By default, Flutter Driver waits until there is no pending frame scheduled
 in the app under test before executing an action. This mechanism is called
 "frame sync". It greatly reduces flakiness because Flutter Driver will not
 execute an action while the app under test is undergoing a transition.

 Having said that, sometimes it is necessary to disable the frame sync
 mechanism (e.g. if there is an ongoing animation in the app, it will
 never reach a state where there are no pending frames scheduled and the
 action will time out). For these cases, the sync mechanism can be disabled
 by wrapping the actions to be performed by this [runUnsynchronized] method.

 With frame sync disabled, it's the responsibility of the test author to
 ensure that no action is performed while the app is undergoing a
 transition to avoid flakiness.

## Return Type
`Future&lt;T&gt;`

## Parameters

- `action`: `Future&lt;T&gt; `
- ``: `dynamic`

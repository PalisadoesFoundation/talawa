# Method: `debugUnlockDelegate`

## Description

This is called by [PlatformMenuBar] when it is disposed, so that another
 one can take over.

 If the [debugUnlockDelegate] successfully unlocks the delegate, it will
 return true.

 See also:

  * [debugLockDelegate], where the delegate is locked.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`

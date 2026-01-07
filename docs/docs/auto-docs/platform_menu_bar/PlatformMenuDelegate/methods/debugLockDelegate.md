# Method: `debugLockDelegate`

## Description

This is called by [PlatformMenuBar] when it is initialized, to be sure that
 only one is active at a time.

 The [debugLockDelegate] function should be called before the first call to
 [setMenus].

 If the lock is successfully acquired, [debugLockDelegate] will return
 true.

 If your implementation of a [PlatformMenuDelegate] can have only limited
 active instances, enforce it when you override this function.

 See also:

  * [debugUnlockDelegate], where the delegate is unlocked.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`

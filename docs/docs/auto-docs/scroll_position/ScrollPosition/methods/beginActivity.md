# Method: `beginActivity`

## Description

Change the current [activity], disposing of the old one and
 sending scroll notifications as necessary.

 If the argument is null, this method has no effect. This is convenient for
 cases where the new activity is obtained from another method, and that
 method might return null, since it means the caller does not have to
 explicitly null-check the argument.

## Return Type
`void`

## Parameters

- `newActivity`: `ScrollActivity?`

# Method: `dispatch`

## Description

Start bubbling this notification at the given build context.

 The notification will be delivered to any [NotificationListener] widgets
 with the appropriate type parameters that are ancestors of the given
 [BuildContext]. If the [BuildContext] is null, the notification is not
 dispatched.

## Return Type
`void`

## Parameters

- `target`: `BuildContext?`

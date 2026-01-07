# Method: `dispose`

## Description

Called when device stops displaying the cursor.

 After this call, this session instance will no longer be used in the
 future.

 When implementing this method in subclasses, you should release resources
 and prevent [activate] from causing side effects after disposal.

## Return Type
`void`


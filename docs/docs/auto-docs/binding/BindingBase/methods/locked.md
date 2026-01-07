# Method: `locked`

## Description

Whether [lockEvents] is currently locking events.

 Binding subclasses that fire events should check this first, and if it is
 set, queue events instead of firing them.

 Events should be flushed when [unlocked] is called.

## Return Type
`bool`


# Method: `cast`

## Description

Provides a view of this queue as a queue of [R] instances, if necessary.

 If this queue contains only instances of [R], all read operations
 will work correctly. If any operation tries to access an element
 that is not an instance of [R], the access will throw instead.

 Elements added to the queue (e.g., by using [addFirst] or [addAll])
 must be instances of [R] to be valid arguments to the adding function,
 and they must also be instances of [E] to be accepted by
 this queue as well.

 Methods which accept `Object?` as argument, like [contains] and [remove],
 will pass the argument directly to the this queue's method
 without any checks.
 That means that you can do `queueOfStrings.cast&lt;int&gt;.remove("a")`
 successfully, even if it looks like it shouldn't have any effect.

## Return Type
`Queue&lt;R&gt;`


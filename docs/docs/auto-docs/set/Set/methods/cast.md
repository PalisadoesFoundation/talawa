# Method: `cast`

## Description

Provides a view of this set as a set of [R] instances.

 If this set contains only instances of [R], all read operations
 will work correctly. If any operation tries to access an element
 that is not an instance of [R], the access will throw instead.

 Elements added to the set (e.g., by using [add] or [addAll])
 must be instances of [R] to be valid arguments to the adding function,
 and they must be instances of [E] as well to be accepted by
 this set as well.

 Methods which accept one or more `Object?` as argument,
 like [contains], [remove] and [removeAll],
 will pass the argument directly to the this set's method
 without any checks.
 That means that you can do `setOfStrings.cast&lt;int&gt;.remove("a")`
 successfully, even if it looks like it shouldn't have any effect.

## Return Type
`Set&lt;R&gt;`


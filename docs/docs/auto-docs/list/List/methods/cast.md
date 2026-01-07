# Method: `cast`

## Description

Returns a view of this list as a list of [R] instances.

 If this list contains only instances of [R], all read operations
 will work correctly. If any operation tries to read an element
 that is not an instance of [R], the access will throw instead.

 Elements added to the list (e.g., by using [add] or [addAll])
 must be instances of [R] to be valid arguments to the adding function,
 and they must also be instances of [E] to be accepted by
 this list as well.

 Methods which accept `Object?` as argument, like [contains] and [remove],
 will pass the argument directly to the this list's method
 without any checks.
 That means that you can do `listOfStrings.cast&lt;int&gt;.remove("a")`
 successfully, even if it looks like it shouldn't have any effect.

 Typically implemented as `List.castFrom&lt;E, R&gt;(this)`.

## Return Type
`List&lt;R&gt;`


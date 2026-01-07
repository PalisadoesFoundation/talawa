# Method: `dispose`

## Description

Release any resources held by this render object.

 The object that creates a RenderObject is in charge of disposing it.
 If this render object has created any children directly, it must dispose
 of those children in this method as well. It must not dispose of any
 children that were created by some other object, such as
 a [RenderObjectElement]. Those children will be disposed when that
 element unmounts, which may be delayed if the element is moved to another
 part of the tree.

 Implementations of this method must end with a call to the inherited
 method, as in `super.`.

 The object is no longer usable after calling dispose.

## Return Type
`void`


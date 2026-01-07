# Method: `applyTo`

## Description

Combines this [ScrollPhysics] instance with the given physics.

 The returned object uses this instance's physics when it has an
 opinion, and defers to the given `ancestor` object's physics
 when it does not.

 If [parent] is null then this returns a [ScrollPhysics] with the
 same [runtimeType], but where the [parent] has been replaced
 with the [ancestor].

 If this scroll physics object already has a parent, then this
 method is applied recursively and ancestor will appear at the
 end of the existing chain of parents.

 Calling this method with a null argument will copy the current
 object. This is inefficient.

 

 In the following example, the [applyTo] method is used to combine the
 scroll physics of two [ScrollPhysics] objects. The resulting [ScrollPhysics]
 `x` has the same behavior as `y`.

 ```dart
 final FooScrollPhysics x = const .applyTo(const );
 const FooScrollPhysics y = FooScrollPhysics(parent: );
 ```
 

 ## Implementing [applyTo]

 When creating a custom [ScrollPhysics] subclass, this method
 must be implemented. If the physics class has no constructor
 arguments, then implementing this method is merely a matter of
 calling the constructor with a [parent] constructed using
 [buildParent], as follows:

 ```dart
 class MyScrollPhysics extends ScrollPhysics 
 ```

 If the physics class has constructor arguments, they must be passed to
 the constructor here as well, so as to create a clone.

 See also:

  * [buildParent], a utility method that's often used to define [applyTo]
    methods for [ScrollPhysics] subclasses.

## Return Type
`ScrollPhysics`

## Parameters

- `ancestor`: `ScrollPhysics?`

# Method: `noSuchMethod`

## Description

Invoked when a nonexistent method or property is accessed.

 A dynamic member invocation can attempt to call a member which
 doesn't exist on the receiving object. Example:
 ```dart
 dynamic object = 1;
 object.add(42); // Statically allowed, run-time error
 ```
 This invalid code will invoke the `noSuchMethod` method
 of the integer `1` with an [Invocation] representing the
 `.add(42)` call and arguments (which then throws).

 Classes can override [noSuchMethod] to provide custom behavior
 for such invalid dynamic invocations.

 A class with a non-default [noSuchMethod] invocation can also
 omit implementations for members of its interface.
 Example:
 ```dart
 class MockList&lt;T> implements List<T&gt; 
 void  
 ```
 This code has no compile-time warnings or errors even though
 the `MockList` class has no concrete implementation of
 any of the `List` interface methods.
 Calls to `List` methods are forwarded to `noSuchMethod`,
 so this code will `log` an invocation similar to
 `Invocation.method(#add, [42])` and then throw.

 If a value is returned from `noSuchMethod`,
 it becomes the result of the original invocation.
 If the value is not of a type that can be returned by the original
 invocation, a type error occurs at the invocation.

 The default behavior is to throw a [NoSuchMethodError].

## Return Type
`dynamic`

## Parameters

- `invocation`: `Invocation`

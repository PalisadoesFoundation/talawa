




noSuchMethod method - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. noSuchMethod method

noSuchMethod


dark\_mode

light\_mode




# noSuchMethod method


dynamic
noSuchMethod(

1. Invocation invocation

)
inherited

Invoked when a nonexistent method or property is accessed.

A dynamic member invocation can attempt to call a member which
doesn't exist on the receiving object. Example:

```
dynamic object = 1;
object.add(42); // Statically allowed, run-time error

```

This invalid code will invoke the `noSuchMethod` method
of the integer `1` with an `Invocation` representing the
`.add(42)` call and arguments (which then throws).

Classes can override `noSuchMethod` to provide custom behavior
for such invalid dynamic invocations.

A class with a non-default `noSuchMethod` invocation can also
omit implementations for members of its interface.
Example:

```
class MockList<T> implements List<T> {
  noSuchMethod(Invocation invocation) {
    log(invocation);
    super.noSuchMethod(invocation); // Will throw.
  }
}
void main() {
  MockList().add(42);
}

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

The default behavior is to throw a `NoSuchMethodError`.


## Implementation

```
@pragma("vm:entry-point")
@pragma("wasm:entry-point")
external dynamic noSuchMethod(Invocation invocation);
```

 


1. [talawa](../../index.html)
2. [chat\_queries](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. noSuchMethod method

##### ChatQueries class





talawa
1.0.0+1







# Overview for `Function`

## Description

A function value.

 The `Function` class is a supertype of all *function types*, and contains
 no values itself. All objects that implement `Function`
 have a function type as their runtime type.

 The `Function` type does not carry information about the
 parameter signatures or return type of a function.
 To express a more precise function type, use the function type syntax,
 which is the `Function` keyword followed by a parameter list,
 or a type argument list and a parameter list, and which can also have
 an optional return type.

 The function type syntax mirrors the definition of a function,
 with the function name replaced by the word "Function".

 Example:
 ```dart
 String numberToString(int n) => "$n";
 String Function(int n) fun = numberToString; // Type annotation
 assert(fun is String Function(int)); // Type check.
 List<String Function(int)> functions = [fun]; // Type argument.
 ```
 The type `String Function(int)` is the type of a function
 that takes one positional `int` argument and returns a `String`.

 Example with generic function type:
 ```dart
 T id&lt;T&gt;(T value) => value;
 X Function&lt;X&gt;(X) anotherId = id; // Parameter name may be omitted.
 int Function(int) intId = id&lt;int&gt;;
 ```

 A function type can be used anywhere a type is allowed,
 and is often used for functions taking other functions, "callbacks",
 as arguments.

 ```dart
 void doSomething(String Function(int) callback) 
 ```

 A function type has all the members declared by [Object],
 since function types are subtypes of [Object].

 A function type also has a `call` method with a signature
 that has the same function type as the function type itself.
 Calling the `call` method behaves just as calling the function.
 This is mainly used to conditionally call a nullable function value.
 ```dart
 String Function(int) fun = (n) => "$n";
 String Function(int) fun2 = fun.call; // Valid.
 print(fun2.call(1)); // Prints "1".

 String Function(int)? maybeFun = . ? fun : null;
 print(maybeFun?.call(1)); // Prints "1" or "null".
 ```

 The [Function] type has a number of special features which are not visible
 in this `class` declaration.

 The `Function` type itself allows any function to be assigned to it,
 since it is a supertype of any function type,
 but does not say how the function can be called.

 However, a value with the static type `Function` *can* still be called
 like a function.
 ```dart
 Function f = (int x) => "$x";
 print(f(1)); // Prints "1".

 f("not", "one", "int"); // Throws! No static warning.
 ```
 Such an invocation is a *dynamic* invocation,
 precisely as if the function value had been statically typed as [dynamic],
 and is precisely as unsafe as any other dynamic invocation.
 Checks will be performed at run-time to ensure that the argument
 list matches the function's parameters, and if not the call will
 fail with an [Error].
 There is no static type checking for such a call, any argument list
 is accepted and checked at runtime.

 Like every function type has a `call` method with its own function type,
 the `Function` type has a special `call` member
 which acts as if it is a method with a function type of `Function`
 (which is not a method signature which can be expressed in normal
 Dart code).
 ```dart
 Function fun = (int x) => "$x";

 var fun2 = fun.call; // Inferred type of `fun2` is `Function`.

 print(fun2.call(1)); // Prints "1";

 Function? maybeFun = . ? fun : null;
 print(maybeFun?.call(1)); // Prints "1" or "null".
 ```


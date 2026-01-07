# Overview for `Invocation`

## Description

Representation of the invocation of a member on an object.

 This is the type of objects passed to [Object.noSuchMethod] when
 an object doesn't support the member invocation that was attempted
 on it.

## Constructors

### Unnamed Constructor


### method
Creates an invocation corresponding to a method invocation.

 The method invocation has no type arguments.
 If the named arguments are omitted, they default to no named arguments.

#### Parameters

- `memberName`: `Symbol`
- `positionalArguments`: `Iterable<Object?>?`
- ``: `dynamic`
### genericMethod
Creates an invocation corresponding to a generic method invocation.

 If [typeArguments] is `null` or empty, the constructor is equivalent to
 calling [Invocation.method] with the remaining arguments.
 All the individual type arguments must be non-null.

 If the named arguments are omitted, they default to no named arguments.

#### Parameters

- `memberName`: `Symbol`
- `typeArguments`: `Iterable&lt;Type&gt;?`
- `positionalArguments`: `Iterable<Object?>?`
- ``: `dynamic`
### getter
Creates an invocation corresponding to a getter invocation.

#### Parameters

- `name`: `Symbol`
### setter
Creates an invocation corresponding to a setter invocation.

 This constructor accepts any [Symbol] as [memberName], but remember that
 *actual setter names* end in `=`, so the invocation corresponding
 to `object.member = value` is
 ```dart
 Invocation.setter(const Symbol("member="), value)
 ```

#### Parameters

- `memberName`: `Symbol`
- `argument`: `Object?`

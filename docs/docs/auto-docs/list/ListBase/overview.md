# Overview for `ListBase`

## Description

Abstract implementation of a list.

 `ListBase` can be used as a base class for implementing the `List`
 interface.

 This class implements all read operations using only the `length` and
 `operator[]` and members. It implements write operations using those and
 `add`, `length=` and `operator[]=`
 Classes using this base class should implement those five operations.

 **NOTICE**: For backwards compatibility reasons,
 there is a default implementation of `add`
 which only works for lists with a nullable element type.
 For list with a non-nullable element type,
 the `add` method must be implemented.

 **NOTICE**: Forwarding just the four `length` and `[]` read/write operations
 to a normal growable [List] (as created by a `[]` literal)
 will give very bad performance for `add` and `addAll` operations
 of `ListBase`.
 These operations are implemented by
 increasing the length of the list by one for each `add` operation,
 and repeatedly increasing the length of a growable list is not efficient.
 To avoid this, override 'add' and 'addAll' to also forward directly
 to the growable list, or, if possible, use `DelegatingList` from
 "package:collection/collection.dart" instead of a `ListMixin`.

## Dependencies

- List

## Constructors

### Unnamed Constructor



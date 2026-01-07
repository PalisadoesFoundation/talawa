# Overview for `Record`

## Description

A record value.

 The `Record` class is a supertype of all *record types*,
 but is not itself the runtime type of any object instances
 _(it's an abstract class)_.
 All objects that implement `Record` has a record type as their runtime type.

 A record value, described by a record type, consists of a number of fields,
 which are each either positional or named.

 Record values and record types are written similarly to
 argument lists and simplified function type parameter lists (no `required`
 modifier allowed, or needed, since record fields are never optional).
 Example:
 ```dart
 (int, String, ) triple = (1, "one", isValid: true);
 ```
 is syntactically similar to
 ```dart
 typedef F = void Function(int, String, );
 void callIt(F f) => f(1, "one", isValid: true);
 ```

 Every record and record type has a *shape*,
 given by the number of positional fields and the names of named fields.
 For example:
 ```dart continued
 (double value, String name, ) another = (
      3.14, "Pi", isValid: "real");
 ```
 is another record declaration with the same *shape* (two positional fields,
 one named field named `isValid`), but with a different type.
 The names written on the positional fields are entirely for documentation
 purposes, they have no effect on the program _(same as names on positional
 parameters in function types, like `typedef F = int Function(int value);`,
 where the identifier `value` has no effect)_.

 Record values are mainly destructured using patterns, like:
 ```dart continued
 switch (triple) 
 ```
 The individual fields can also be accessed using named getters,
 using `$1`, `$2`, etc. for positional fields, and the names themselves
 for named fields.
 ```dart continued
 int value = triple.$1;
 String name = triple.$2;
 bool ok = triple.isValid;
 ```
 Because of that, some identifiers cannot be used as names of named fields:
 * The names of `Object` members: `hashCode`, `runtimeType`, `toString` and
   `noSuchMethod`.
 * The name of a positional getter in the same record, so `(0, $1: 0)` is
   invalid, but `(0, $2: 0)` is valid, since there is no positional field
   with getter `$2` in *that* record shape. _(It'll still be confusing,
   and should be avoided in practice.)_
 * Also, no name starting with an underscore, `_`, is allowed. Field names
   cannot be library private.

 The run-time type of a record object is a record type, and as such, a
 subtype of [Record], and transitively of [Object] and its supertypes.

 Record values do not have a persistent [identical] behavior.
 A reference to a record object can change *at any time* to a reference
 to another record object with the same shape and field values.

 Other than that, a record type can only be a subtype of another record
 type with the same shape, and only if the former record type's field types
 are subtypes of the other record type's corresponding field types.
 That is, `(int, String, )` is a subtype of
 `(num, String, )`, because they have the same shape,
 and the field types are pointwise subtypes.
 Record types with different shapes are unrelated to each other.


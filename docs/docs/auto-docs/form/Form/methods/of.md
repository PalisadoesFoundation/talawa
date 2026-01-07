# Method: `of`

## Description

Returns the [FormState] of the closest [Form] widget which encloses the
 given context.

 Typical usage is as follows:

 ```dart
 FormState form = Form.of(context);
 form.;
 ```

 If no [Form] ancestor is found, this will assert in debug mode, and throw
 an exception in release mode.

 Calling this method will create a dependency on the closest [Form] in the
 [context].

 See also:

 * [Form.maybeOf], which is similar to this method, but returns null if no
   [Form] ancestor is found.

## Return Type
`FormState`

## Parameters

- `context`: `BuildContext`

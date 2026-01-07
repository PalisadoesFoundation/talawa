# Method: `maybeOf`

## Description

Returns the [FormState] of the closest [Form] widget which encloses the
 given context, or null if none is found.

 Typical usage is as follows:

 ```dart
 FormState? form = Form.maybeOf(context);
 form?.;
 ```

 Calling this method will create a dependency on the closest [Form] in the
 [context], if there is one.

 See also:

 * [Form.of], which is similar to this method, but asserts if no [Form]
   ancestor is found.

## Return Type
`FormState?`

## Parameters

- `context`: `BuildContext`

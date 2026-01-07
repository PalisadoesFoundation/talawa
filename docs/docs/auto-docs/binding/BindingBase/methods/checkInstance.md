# Method: `checkInstance`

## Description

A method that shows a useful error message if the given binding
 instance is not initialized.

 See [initInstances] for advice on using this method.

 This method either returns the argument or throws an exception.
 In release mode it always returns the argument.

 The type argument `T` should be the kind of binding mixin (e.g.
 `SchedulerBinding`) that is calling the method. It is used in
 error messages.

## Return Type
`T`

## Parameters

- `instance`: `T?`

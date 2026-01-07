# Method: `inheritFrom`

## Description

Makes [context] dependent on the specified [aspect] of an [InheritedModel]
 of type T.

 When the given [aspect] of the model changes, the [context] will be
 rebuilt. The [updateShouldNotifyDependent] method must determine if a
 change in the model widget corresponds to an [aspect] value.

 The dependencies created by this method target all [InheritedModel] ancestors
 of type T up to and including the first one for which [isSupportedAspect]
 returns true.

 If [aspect] is null this method is the same as
 `context.dependOnInheritedWidgetOfExactType&lt;T&gt;`.

 If no ancestor of type T exists, null is returned.

## Return Type
`T?`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`

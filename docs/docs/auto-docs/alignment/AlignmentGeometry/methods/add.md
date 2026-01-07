# Method: `add`

## Description

Returns the sum of two [AlignmentGeometry] objects.

 If you know you are adding two [Alignment] or two [AlignmentDirectional]
 objects, consider using the `+` operator instead, which always returns an
 object of the same type as the operands, and is typed accordingly.

 If [add] is applied to two objects of the same type ([Alignment] or
 [AlignmentDirectional]), an object of that type will be returned (though
 this is not reflected in the type system). Otherwise, an object
 representing a combination of both is returned. That object can be turned
 into a concrete [Alignment] using [resolve].

## Return Type
`AlignmentGeometry`

## Parameters

- `other`: `AlignmentGeometry`

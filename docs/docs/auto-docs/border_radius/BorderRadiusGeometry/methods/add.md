# Method: `add`

## Description

Returns the sum of two [BorderRadiusGeometry] objects.

 If you know you are adding two [BorderRadius] or two [BorderRadiusDirectional]
 objects, consider using the `+` operator instead, which always returns an
 object of the same type as the operands, and is typed accordingly.

 If [add] is applied to two objects of the same type ([BorderRadius] or
 [BorderRadiusDirectional]), an object of that type will be returned (though
 this is not reflected in the type system). Otherwise, an object
 representing a combination of both is returned. That object can be turned
 into a concrete [BorderRadius] using [resolve].

## Return Type
`BorderRadiusGeometry`

## Parameters

- `other`: `BorderRadiusGeometry`

# Method: `subtract`

## Description

Returns the difference between two [EdgeInsetsGeometry] objects.

 If you know you are applying this to two [EdgeInsets] or two
 [EdgeInsetsDirectional] objects, consider using the binary infix `-`
 operator instead, which always returns an object of the same type as the
 operands, and is typed accordingly.

 If [subtract] is applied to two objects of the same type ([EdgeInsets] or
 [EdgeInsetsDirectional]), an object of that type will be returned (though
 this is not reflected in the type system). Otherwise, an object
 representing a combination of both is returned. That object can be turned
 into a concrete [EdgeInsets] using [resolve].

 This method returns the same result as [add] applied to the result of
 negating the argument (using the prefix unary `-` operator or multiplying
 the argument by -1.0 using the `*` operator).

## Return Type
`EdgeInsetsGeometry`

## Parameters

- `other`: `EdgeInsetsGeometry`

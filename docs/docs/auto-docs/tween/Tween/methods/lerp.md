# Method: `lerp`

## Description

Returns the value this variable has at the given animation clock value.

 The default implementation of this method uses the `+`, `-`, and `*`
 operators on `T`. The [begin] and [end] properties must therefore be
 non-null by the time this method is called.

 In general, however, it is possible for this to return null, especially
 when `t`=0.0 and [begin] is null, or `t`=1.0 and [end] is null.

## Return Type
`T`

## Parameters

- `t`: `double`

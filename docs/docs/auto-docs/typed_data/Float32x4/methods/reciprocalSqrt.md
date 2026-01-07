# Method: `reciprocalSqrt`

## Description

Lane-wise approximation of reciprocal square root.

 Approximates the same result as [reciprocal] followed by [sqrt],
 or [sqrt] followed by [reciprocal],
 but may be more precise and/or efficient due to computing the result
 directly, rather than not creating a an intermediate result,
 and possibly by working entirely at a reduced precision.

 The result can differ between platforms due to differences in
 approximation and precision, and for values where the order of [sqrt] and
 [reciprocal] makes a difference.
 The latter applies specifically to `-0.0`
 where `sqrt(-0.0)` is defined to be -0.0,
 and `reciprocal` of that is -Infinity.
 In the opposite order it computes `sqrt` of -Infinity which is NaN.

## Return Type
`Float32x4`


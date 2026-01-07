# Method: `gcd`

## Description

Returns the greatest common divisor of this integer and [other].

 If either number is non-zero, the result is the numerically greatest
 integer dividing both `this` and `other`.

 The greatest common divisor is independent of the order,
 so `x.gcd(y)` is  always the same as `y.gcd(x)`.

 For any integer `x`, `x.gcd(x)` is `x.`.

 If both `this` and `other` is zero, the result is also zero.

 Example:
 ```dart
 print(4.gcd(2)); // 2
 print(8.gcd(4)); // 4
 print(10.gcd(12)); // 2
 print(10.gcd(0)); // 10
 print((-2).gcd(-3)); // 1
 ```

## Return Type
`int`

## Parameters

- `other`: `int`

# Method: `clampMagnitude`

## Description

Return a velocity whose magnitude has been clamped to [minValue]
 and [maxValue].

 If the magnitude of this Velocity is less than minValue then return a new
 Velocity with the same direction and with magnitude [minValue]. Similarly,
 if the magnitude of this Velocity is greater than maxValue then return a
 new Velocity with the same direction and magnitude [maxValue].

 If the magnitude of this Velocity is within the specified bounds then
 just return this.

## Return Type
`Velocity`

## Parameters

- `minValue`: `double`
- `maxValue`: `double`

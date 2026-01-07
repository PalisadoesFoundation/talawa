# Method: `applySurfaceTint`

## Description

Applies a surface tint color to a given container color to indicate
 the level of its elevation.

 With Material Design 3, some components will use a "surface tint" color
 overlay with an opacity applied to their base color to indicate they are
 elevated. The amount of opacity will vary with the elevation as described
 in: https://m3.material.io/styles/color/the-color-system/color-roles.

 If [surfaceTint] is not null and not completely transparent ([Color.alpha]
 is 0), then the returned color will be the given [color] with the
 [surfaceTint] of the appropriate opacity applied to it. Otherwise it will
 just return [color] unmodified.

## Return Type
`Color`

## Parameters

- `color`: `Color`
- `surfaceTint`: `Color?`
- `elevation`: `double`

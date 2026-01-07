# Method: `dayPeriodColor`

## Description

The background color of the AM/PM toggle.

 If [dayPeriodColor] is a [WidgetStateColor], then the effective
 background color can depend on the [WidgetState.selected] state, i.e.
 if the segment is selected or not.

 By default, if the segment is selected, the overall theme's
 `ColorScheme.primary.withOpacity(0.12)` is used when the overall theme's
 brightness is [Brightness.light] and
 `ColorScheme.primary.withOpacity(0.24)` is used when the overall theme's
 brightness is [Brightness.dark].
 If the segment is not selected, [Colors.transparent] is used to allow the
 [Dialog]'s color to be used.

## Return Type
`Color?`


# Method: `pointerAxisModifiers`

## Description

A set of [LogicalKeyboardKey]s that, when any or all are pressed in
 combination with a [PointerDeviceKind.mouse] pointer scroll event, will
 flip the axes of the scroll input.

 This will for example, result in the input of a vertical mouse wheel, to
 move the [ScrollPosition] of a [ScrollView] with an [Axis.horizontal]
 scroll direction.

 If other keys exclusive of this set are pressed during a scroll event, in
 conjunction with keys from this set, the scroll input will still be
 flipped.

 Defaults to [LogicalKeyboardKey.shiftLeft],
 [LogicalKeyboardKey.shiftRight].

## Return Type
`Set&lt;LogicalKeyboardKey&gt;`


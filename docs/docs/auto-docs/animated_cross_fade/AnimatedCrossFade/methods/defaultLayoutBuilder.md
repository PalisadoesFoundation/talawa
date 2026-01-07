# Method: `defaultLayoutBuilder`

## Description

The default layout algorithm used by [AnimatedCrossFade].

 The top child is placed in a stack that sizes itself to match the top
 child. The bottom child is positioned at the top of the same stack, sized
 to fit its width but without forcing the height. The stack is then
 clipped.

 This is the default value for [layoutBuilder]. It implements
 [AnimatedCrossFadeBuilder].

## Return Type
`Widget`

## Parameters

- `topChild`: `Widget`
- `topChildKey`: `Key`
- `bottomChild`: `Widget`
- `bottomChildKey`: `Key`

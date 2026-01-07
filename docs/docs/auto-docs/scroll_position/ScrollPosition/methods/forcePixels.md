# Method: `forcePixels`

## Description

Change the value of [pixels] to the new value, and notify any customers,
 but without honoring normal conventions for changing the scroll offset.

 This is used to implement [jumpTo]. It can also be used adjust the
 position when the dimensions of the viewport change. It should only be
 used when manually implementing the logic for honoring the relevant
 conventions of the class. For example, [ScrollPositionWithSingleContext]
 introduces [ScrollActivity] objects and uses [forcePixels] in conjunction
 with adjusting the activity, e.g. by calling
 [ScrollPositionWithSingleContext.goIdle], so that the activity does
 not immediately set the value back. (Consider, for instance, a case where
 one is using a [DrivenScrollActivity]. That object will ignore any calls
 to [forcePixels], which would result in the rendering stuttering: changing
 in response to [forcePixels], and then changing back to the next value
 derived from the animation.)

 To cause the position to jump or animate to a new value, consider [jumpTo]
 or [animateTo].

 This should not be called during layout (e.g. when setting the initial
 scroll offset). Consider [correctPixels] if you find you need to adjust
 the position during layout.

## Return Type
`void`

## Parameters

- `value`: `double`

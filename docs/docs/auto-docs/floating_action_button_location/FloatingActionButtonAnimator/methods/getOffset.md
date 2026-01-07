# Method: `getOffset`

## Description

Gets the [FloatingActionButton]'s position relative to the origin of the
 [Scaffold] based on [progress].

 [begin] is the [Offset] provided by the previous
 [FloatingActionButtonLocation].

 [end] is the [Offset] provided by the new
 [FloatingActionButtonLocation].

 [progress] is the current progress of the transition animation.
 When [progress] is 0.0, the returned [Offset] should be equal to [begin].
 when [progress] is 1.0, the returned [Offset] should be equal to [end].

## Return Type
`Offset`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

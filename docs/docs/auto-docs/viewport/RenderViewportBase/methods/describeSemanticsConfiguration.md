# Method: `describeSemanticsConfiguration`

## Description

Report the semantics of this node, for example for accessibility purposes.

 [RenderViewportBase] adds [RenderViewport.useTwoPaneSemantics] to the
 provided [SemanticsConfiguration] to support children using
 [RenderViewport.excludeFromScrolling].

 This method should be overridden by subclasses that have interesting
 semantic information. Overriding subclasses should call
 `super.describeSemanticsConfiguration(config)` to ensure
 [RenderViewport.useTwoPaneSemantics] is still added to `config`.

 See also:

 * [RenderObject.describeSemanticsConfiguration], for important
   details about not mutating a [SemanticsConfiguration] out of context.

## Return Type
`void`

## Parameters

- `config`: `SemanticsConfiguration`

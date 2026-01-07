# Method: `createBallisticSimulation`

## Description

Returns a simulation for ballistic scrolling starting from the given
 position with the given velocity.

 This is used by [ScrollPositionWithSingleContext] in the
 [ScrollPositionWithSingleContext.goBallistic] method. If the result
 is non-null, [ScrollPositionWithSingleContext] will begin a
 [BallisticScrollActivity] with the returned value. Otherwise, it will
 begin an idle activity instead.

 The given `position` is only valid during this method call. Do not keep a
 reference to it to use later, as the values may update, may not update, or
 may update to reflect an entirely unrelated scrollable.

 This method can potentially be called in every frame, even in the middle
 of what the user perceives as a single ballistic scroll.  For example, in
 a [ListView] when previously off-screen items come into view and are laid
 out, this method may be called with a new [ScrollMetrics.maxScrollExtent].
 The method implementation should ensure that when the same ballistic
 scroll motion is still intended, these calls have no side effects on the
 physics beyond continuing that motion.

 Generally this is ensured by having the [Simulation] conform to a physical
 metaphor of a particle in ballistic flight, where the forces on the
 particle depend only on its position, velocity, and environment, and not
 on the current time or any internal state.  This means that the
 time-derivative of [Simulation.dx] should be possible to write
 mathematically as a function purely of the values of [Simulation.x],
 [Simulation.dx], and the parameters used to construct the [Simulation],
 independent of the time.

## Return Type
`Simulation?`

## Parameters

- `position`: `ScrollMetrics`
- `velocity`: `double`

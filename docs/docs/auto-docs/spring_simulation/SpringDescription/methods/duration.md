# Method: `duration`

## Description

The duration parameter used in [SpringDescription.withDurationAndBounce].

 This value defines the perceptual duration of the spring, controlling
 its overall pace. It is approximately equal to the time it takes for
 the spring to settle, but for highly bouncy springs, it instead
 corresponds to the oscillation period.

 This duration does not represent the exact time for the spring to stop
 moving. For example, when [bounce] is 1, the spring oscillates
 indefinitely, even though [duration] has a finite value. To determine
 when the motion has effectively stopped within a certain tolerance,
 use [SpringSimulation.isDone].

 Defaults to 0.5 seconds.

## Return Type
`Duration`


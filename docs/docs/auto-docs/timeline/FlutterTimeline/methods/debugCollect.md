# Method: `debugCollect`

## Description

Returns timings collected since [debugCollectionEnabled] was set to true,
 since the previous [debugCollect], or since the previous [debugReset],
 whichever was last.

 Resets the collected timings.

 This is only meant to be used in non-release modes, typically in profile
 mode that provides timings close to release mode timings.

## Return Type
`AggregatedTimings`


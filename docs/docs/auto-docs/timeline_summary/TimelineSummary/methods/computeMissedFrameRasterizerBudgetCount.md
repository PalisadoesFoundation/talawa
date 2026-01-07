# Method: `computeMissedFrameRasterizerBudgetCount`

## Description

The number of frames that missed the [kBuildBudget] on the raster thread
 and therefore are in the danger of missing frames.

 This does not take into account the real device frame rate. Prefer using
 [computePercentileFrameRasterizerTimeMillis] for evaluating performance.

## Return Type
`int`


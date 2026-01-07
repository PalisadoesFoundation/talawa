# Method: `computeMissedFrameBuildBudgetCount`

## Description

The number of frames that missed the [kBuildBudget] and therefore are
 in the danger of missing frames.

 This does not take into account the real device frame rate. Prefer using
 [computePercentileFrameBuildTimeMillis] for evaluating performance.

## Return Type
`int`


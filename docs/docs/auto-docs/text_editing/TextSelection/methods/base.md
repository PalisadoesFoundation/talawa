# Method: `base`

## Description

The position at which the selection originates.

 
 The [TextAffinity] of the resulting [TextPosition] is based on the
 relative logical position in the text to the other selection endpoint:
  * if [baseOffset] < [extentOffset], [base] will have
    [TextAffinity.downstream] and [extent] will have
    [TextAffinity.upstream].
  * if [baseOffset] > [extentOffset], [base] will have
    [TextAffinity.upstream] and [extent] will have
    [TextAffinity.downstream].
  * if [baseOffset] == [extentOffset], [base] and [extent] will both have
    the collapsed selection's [affinity].
 

 Might be larger than, smaller than, or equal to extent.

## Return Type
`TextPosition`


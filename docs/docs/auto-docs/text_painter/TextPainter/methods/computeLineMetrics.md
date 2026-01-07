# Method: `computeLineMetrics`

## Description

Returns the full list of [LineMetrics] that describe in detail the various
 metrics of each laid out line.

 The [LineMetrics] list is presented in the order of the lines they represent.
 For example, the first line is in the zeroth index.

 [LineMetrics] contains measurements such as ascent, descent, baseline, and
 width for the line as a whole, and may be useful for aligning additional
 widgets to a particular line.

 Valid only after [layout] has been called.

## Return Type
`List<ui.LineMetrics>`


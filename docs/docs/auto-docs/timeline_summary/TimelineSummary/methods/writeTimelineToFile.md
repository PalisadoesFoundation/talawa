# Method: `writeTimelineToFile`

## Description

Writes all of the recorded timeline data to a file.

 By default, this will dump [summaryJson] to a companion file named
 `$traceName.timeline_summary.json`. If you want to skip the summary, set
 the `includeSummary` parameter to false.

 See also:

 * [Timeline.fromJson], which explains detail about the timeline data.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `traceName`: `String`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

# Overview for `AggregatedTimings`

## Description

Provides aggregated results for timings collected by [FlutterTimeline].

## Members

- **timedBlocks**: `List&lt;TimedBlock&gt;`
  All timed blocks collected between the last reset and [FlutterTimeline.debugCollect].

- **aggregatedBlocks**: `List&lt;AggregatedTimedBlock&gt;`
  Aggregated timed blocks collected between the last reset and [FlutterTimeline.debugCollect].

 Does not guarantee that all code blocks will be reported. Only those that
 executed since the last reset are listed here. Use [getAggregated] for
 graceful handling of missing code blocks.

## Constructors

### Unnamed Constructor
Creates aggregated timings for the provided timed blocks.


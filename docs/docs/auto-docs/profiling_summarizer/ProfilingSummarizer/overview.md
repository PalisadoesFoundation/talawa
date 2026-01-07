# Overview for `ProfilingSummarizer`

## Description

Summarizes [TimelineEvent]s corresponding to [kProfilingEvents] category.

 A sample event (some fields have been omitted for brevity):
 ```json
     ,
 ```
 This class provides methods to compute the average and percentile information
 for supported profiles, i.e, CPU, Memory and GPU. Not all of these exist for
 all the platforms.

## Members

- **eventByType**: `Map&lt;ProfileType, List&lt;TimelineEvent&gt;&gt;`
  Key is the type of profiling event, for e.g. CPU, GPU, Memory.

## Constructors

### _


#### Parameters

- `eventByType`: `dynamic`

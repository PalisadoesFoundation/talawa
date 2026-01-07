# Overview for `SectorHitTestResult`

## Description

The result of performing a hit test on [RenderSector]s.

## Dependencies

- HitTestResult

## Constructors

### Unnamed Constructor
Creates an empty hit test result for hit testing on [RenderSector].

### wrap
Wraps `result` to create a [HitTestResult] that implements the
 [SectorHitTestResult] protocol for hit testing on [RenderSector]s.

 This method is used by [RenderObject]s that adapt between the
 [RenderSector]-world and the non-[RenderSector]-world to convert a (subtype of)
 [HitTestResult] to a [SectorHitTestResult] for hit testing on [RenderSector]s.

 The [HitTestEntry]s added to the returned [SectorHitTestResult] are also
 added to the wrapped `result` (both share the same underlying data
 structure to store [HitTestEntry]s).

 See also:

  * [HitTestResult.wrap], which turns a [SectorHitTestResult] back into a
    generic [HitTestResult].

#### Parameters

- ``: `dynamic`

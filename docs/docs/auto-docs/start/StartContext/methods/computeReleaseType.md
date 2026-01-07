# Method: `computeReleaseType`

## Description

Determine which part of the version to increment in the next release.

 If [atBranchPoint] is true, then this is a [ReleaseType.BETA_INITIAL].

## Return Type
`ReleaseType`

## Parameters

- `lastVersion`: `Version`
- `atBranchPoint`: `bool`

# Method: `imgtestAdd`

## Description

Executes the `imgtest add` command in the goldctl tool.

 The `imgtest` command collects and uploads test results to the Skia Gold
 backend, the `add` argument uploads the current image test. A response is
 returned from the invocation of this command that indicates a pass or fail
 result.

 The [testName] and [goldenFile] parameters reference the current
 comparison being evaluated by the [FlutterPostSubmitFileComparator].

## Return Type
`Future&lt;bool&gt;`

## Parameters

- `testName`: `String`
- `goldenFile`: `File`

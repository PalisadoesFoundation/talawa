# Method: `tryjobAdd`

## Description

Executes the `imgtest add` command in the goldctl tool for tryjobs.

 The `imgtest` command collects and uploads test results to the Skia Gold
 backend, the `add` argument uploads the current image test. A response is
 returned from the invocation of this command that indicates a pass or fail
 result for the tryjob.

 The [testName] and [goldenFile] parameters reference the current
 comparison being evaluated by the [FlutterPreSubmitFileComparator].

 If the tryjob fails due to pixel differences, the method will succeed
 as the failure will be triaged in the 'Flutter Gold' dashboard, and the
 `stdout` will contain the failure message; otherwise will return `null`.

## Return Type
`Future<String?>`

## Parameters

- `testName`: `String`
- `goldenFile`: `File`

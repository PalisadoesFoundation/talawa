# Overview for `MetricsResultWriter`

## Description

Class for test runner to write device-lab metrics results for Skia Perf.

## Members

- **processRunSync**: `ProcessResult Function(String, List&lt;String&gt;, )`
- **retryNumber**: `int`
  Threshold to auto retry a failed test.

- **fs**: `FileSystem`
  Underlying [FileSystem] to use.

- **logger**: `Logger`
- **_commitSha**: `String?`
## Constructors

### Unnamed Constructor



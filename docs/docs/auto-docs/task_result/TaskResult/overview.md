# Overview for `TaskResult`

## Description

A result of running a single task.

## Members

- **succeeded**: `bool`
  Whether the task succeeded.

- **data**: `Map&lt;String, dynamic&gt;?`
  Task-specific JSON data

- **detailFiles**: `List&lt;String&gt;?`
  Files containing detail on the run (e.g. timeline trace files)

- **benchmarkScoreKeys**: `List&lt;String&gt;?`
  Keys in [data] that store scores that will be submitted to Cocoon.

 Each key is also part of a benchmark's name tracked by Cocoon.

- **message**: `String?`
  Explains the result in a human-readable format.

## Constructors

### buildOnly


### success
Constructs a successful result.

#### Parameters

- `data`: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### successFromFile
Constructs a successful result using JSON data stored in a file.

#### Parameters

- `file`: `File`
- ``: `dynamic`
- ``: `dynamic`
### fromJson
Constructs a [TaskResult] from JSON.

#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
### failure
Constructs an unsuccessful result.

#### Parameters

- `message`: `dynamic`

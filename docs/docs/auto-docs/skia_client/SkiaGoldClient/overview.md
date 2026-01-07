# Overview for `SkiaGoldClient`

## Description

A client for uploading image tests and making baseline requests to the
 Flutter Gold Dashboard.

## Members

- **fs**: `FileSystem`
  The file system to use for storing the local clone of the repository.

 This is useful in tests, where a local file system (the default) can be
 replaced by a memory file system.

- **platform**: `Platform`
  The environment (current working directory, identity of the OS,
 environment variables, etc).

- **process**: `ProcessManager`
  A controller for launching sub-processes.

 This is useful in tests, where the real process manager (the default) can
 be replaced by a mock process manager that doesn't really create
 sub-processes.

- **httpClient**: `io.HttpClient`
  A client for making Http requests to the Flutter Gold dashboard.

- **workDirectory**: `Directory`
  The local [Directory] within the comparison root for the current test
 context. In this directory, the client will create image and JSON files
 for the goldctl tool to use.

 This is informed by [FlutterGoldenFileComparator.basedir]. It cannot be
 null.

- **log**: `LogCallback`
  The logging function to use when reporting messages to the console.

- **_initialized**: `bool`
  Signals if this client is initialized for uploading images to the Gold
 service.

 Since Flutter framework tests are executed in parallel, and in random
 order, this will signal is this instance of the Gold client has been
 initialized.

- **_tryjobInitialized**: `bool`
  Signals if this client is initialized for uploading tryjobs to the Gold
 service.

 Since Flutter framework tests are executed in parallel, and in random
 order, this will signal is this instance of the Gold client has been
 initialized for tryjobs.

## Constructors

### Unnamed Constructor
Creates a [SkiaGoldClient] with the given [workDirectory] and [Platform].

 All other parameters are optional. They may be provided in tests to
 override the defaults for [fs], [process], and [httpClient].


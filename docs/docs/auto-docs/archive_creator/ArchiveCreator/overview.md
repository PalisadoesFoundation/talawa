# Overview for `ArchiveCreator`

## Description

Creates a pre-populated Flutter archive from a git repo.

## Members

- **platform**: `Platform`
  The platform to use for the environment and determining which
 platform we're running on.

- **branch**: `Branch`
  The branch to build the archive for. The branch must contain [revision].

- **revision**: `String`
  The git revision hash to build the archive for. This revision has
 to be available in the [branch], although it doesn't have to be
 at HEAD, since we clone the branch and then reset to this revision
 to create the archive.

- **flutterRoot**: `Directory`
  The flutter root directory in the [tempDir].

- **tempDir**: `Directory`
  The temporary directory used to build the archive in.

- **outputDir**: `Directory`
  The directory to write the output file to.

- **fs**: `FileSystem`
- **strict**: `bool`
  True if the creator should be strict about checking requirements or not.

 In strict mode, will insist that the [revision] be a tagged revision.

- **_minGitUri**: `Uri`
- **_processRunner**: `ProcessRunner`
- **httpReader**: `HttpReader`
  Used to tell the [ArchiveCreator] which function to use for reading
 bytes from a URL. Used in tests to inject a fake reader. Defaults to
 [http.readBytes].

- **_version**: `Map&lt;String, String&gt;`
- **_flutter**: `String`
- **_dart**: `String`
- **_dartArch**: `Future&lt;String&gt;`
## Constructors

### Unnamed Constructor
[tempDir] is the directory to use for creating the archive. The script
 will place several GiB of data there, so it should have available space.

 The processManager argument is used to inject a mock of [ProcessManager] for
 testing purposes.

 If subprocessOutput is true, then output from processes invoked during
 archive creation is echoed to stderr and stdout.

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`

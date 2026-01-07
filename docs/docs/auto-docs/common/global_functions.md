# Global Functions and Variables

## useMemoryFileSystemForTesting

Overrides the file system so it can be tested without hitting the hard
 drive.

- **Return Type:** `void`

## restoreFileSystem

Restores the file system to the default local file system implementation.

- **Return Type:** `void`

## testOutputsDirectory

Flutter Driver test output directory.

 Tests should write any output files to this directory. Defaults to the path
 set in the FLUTTER_TEST_OUTPUTS_DIR environment variable, or `build` if
 unset.

- **Return Type:** `String`


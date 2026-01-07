# Overview for `StartCommand`

## Description

Command to print the status of the current Flutter release.

 This command has many required options which the user must provide
 via command line arguments (or optionally environment variables).

 This command is the one with the worst user experience (as the user has to
 carefully type out many different options into their terminal) and the one
 that would benefit the most from a GUI frontend. This command will
 optionally read its options from an environment variable to facilitate a workflow
 in which configuration is provided by editing a bash script that sets environment
 variables and then invokes the conductor tool.

## Dependencies

- Command

## Members

- **checkouts**: `Checkouts`
- **conductorVersion**: `String`
- **fileSystem**: `FileSystem`
- **platform**: `Platform`
- **processManager**: `ProcessManager`
- **stdio**: `Stdio`
## Constructors

### Unnamed Constructor



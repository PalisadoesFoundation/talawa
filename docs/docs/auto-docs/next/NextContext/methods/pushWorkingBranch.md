# Method: `pushWorkingBranch`

## Description

Push the working branch to the user's mirror.

 [repository] represents the actual Git repository on disk, and is used to
 call `git push`, while [pbRepository] represents the user-specified
 configuration for the repository, and is used to read the name of the
 working branch and the mirror's remote name.

 May throw either a [ConductorException] if the user already has a branch
 of the same name on their mirror, or a [GitException] for any other
 failures from the underlying git process call.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `repository`: `Repository`
- `pbRepository`: `pb.Repository`

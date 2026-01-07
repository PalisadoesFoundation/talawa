# Overview for `PackageAutoroller`

## Description

A service for rolling the SDK's pub packages to latest and open a PR upstream.

## Members

- **stdio**: `Stdio`
- **framework**: `FrameworkRepository`
- **processManager**: `ProcessManager`
- **githubClient**: `String`
  Path to GitHub CLI client.

- **githubUsername**: `String`
- **token**: `String`
  GitHub API access token.

- **hostname**: `String`
- **featureBranchName**: `Future&lt;String&gt;`
  Name of the feature branch to be opened on against the mirror repo.

 We never re-use a previous branch, so the branch name ends in an index
 number, which gets incremented for each roll.

- **orgName**: `String`
  Name of the GitHub organization to push the feature branch to.

- **_prTitle**: `String`
## Constructors

### Unnamed Constructor



# Overview for `CheckoutStatePostGradleRegeneration`

## Description

Possible states of the Flutter repo checkout after Gradle lockfile
 regeneration.

## Members

- **pattern**: `RegExp`
  Output format for `git status --porcelain` and `git status --short`.

 The first capture group is the path to the file or directory changed,
 relative to the root of the repository.

 See `man git-status` for more reference.

## Constructors

### Unnamed Constructor



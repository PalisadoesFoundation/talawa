# Overview for `NonLockfileChanges`

## Description

There are changed files that do not end in *.lockfile; fail the script.

 Because the script to regenerate Gradle lockfiles triggers a Gradle build,
 and because the packages_autoroller can have its PRs merged without a
 human review, we are conservative about what changes we commit.

## Dependencies

- CheckoutStatePostGradleRegeneration

## Members

- **changes**: `List&lt;String&gt;`
## Constructors

### Unnamed Constructor



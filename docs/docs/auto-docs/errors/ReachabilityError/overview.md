# Overview for `ReachabilityError`

## Description

Error thrown when unsoundness causes flow analysis to be incorrect.

 A switch on an enum type is considered exhaustive if it covers all
 the enum values. If run in unsound null-safety mode, the value
 can also be `null`. If so, a `ReachabilityError` is thrown rather
 than allowing the switch to be inexhaustive.

 This is not a public facing error. It should not happen in sound
 programs.

## Dependencies

- Error

## Members

- **_message**: `String?`
## Constructors

### Unnamed Constructor



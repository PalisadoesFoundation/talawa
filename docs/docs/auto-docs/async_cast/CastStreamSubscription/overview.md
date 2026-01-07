# Overview for `CastStreamSubscription`

## Description



## Dependencies

- StreamSubscription

## Members

- **_source**: `StreamSubscription&lt;S&gt;`
- **_zone**: `Zone`
  Zone where listen was called.

- **_handleData**: `void Function(T)?`
  User's data handler.

- **_handleError**: `Function?`
  Copy of _source's handleError so we can report errors in onData.

## Constructors

### Unnamed Constructor



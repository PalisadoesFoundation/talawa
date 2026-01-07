# Overview for `Symbol`

## Description

/**
 * Implementation of [core.Symbol].  This class uses the same name as
 * a core class so a user can't tell the difference.
 *
 * The purpose of this class is to hide [_name] from user code, but
 * make it accessible to Dart platform code via the static method
 * [getName].
 */

## Dependencies

- Symbol

## Members

- **_name**: `String`
## Constructors

### Unnamed Constructor


### unvalidated
/**
   * Platform-private method used by the mirror system to create
   * otherwise invalid names.
   */

#### Parameters

- `_name`: `dynamic`

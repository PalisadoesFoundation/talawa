# Overview for `MissingPluginException`

## Description

Thrown to indicate that a platform interaction failed to find a handling
 plugin.

 See also:

  * [MethodChannel.invokeMethod], which completes the returned future
    with a [MissingPluginException], if no plugin handler for the method call
    was found.
  * [OptionalMethodChannel.invokeMethod], which completes the returned future
    with null, if no plugin handler for the method call was found.

## Dependencies

- Exception

## Members

- **message**: `String?`
  A human-readable error message, possibly null.

## Constructors

### Unnamed Constructor
Creates a [MissingPluginException] with an optional human-readable
 error message.


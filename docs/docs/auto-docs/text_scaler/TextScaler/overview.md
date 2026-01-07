# Overview for `TextScaler`

## Description

A class that describes how textual contents should be scaled for better
 readability.

 The [scale] function computes the scaled font size given the original
 unscaled font size specified by app developers.

 The [==] operator defines the equality of 2 [TextScaler]s, which the
 framework uses to determine whether text widgets should rebuild when their
 [TextScaler] changes. Consider overriding the [==] operator if applicable
 to avoid unnecessary rebuilds.

## Members

- **noScaling**: `TextScaler`
  A [TextScaler] that doesn't scale the input font size.

 This is equivalent to `TextScaler.linear(1.0)`, the [TextScaler.scale]
 implementation always returns the input font size as-is.

## Constructors

### Unnamed Constructor
Creates a TextScaler.

### linear
Creates a proportional [TextScaler] that scales the incoming font size by
 multiplying it with the given `textScaleFactor`.

#### Parameters

- `textScaleFactor`: `double`

# Overview for `OffsetPair`

## Description

A container for a [local] and [global] [Offset] pair.

 Usually, the [global] [Offset] is in the coordinate space of the screen
 after conversion to logical pixels and the [local] offset is the same
 [Offset], but transformed to a local coordinate space.

## Members

- **zero**: `OffsetPair`
  A [OffsetPair] where both [Offset]s are [Offset.zero].

- **local**: `Offset`
  The [Offset] in the local coordinate space.

- **global**: `Offset`
  The [Offset] in the global coordinate space after conversion to logical
 pixels.

## Constructors

### Unnamed Constructor
Creates a [OffsetPair] combining a [local] and [global] [Offset].

### fromEventPosition
Creates a [OffsetPair] from [PointerEvent.localPosition] and
 [PointerEvent.position].

#### Parameters

- `event`: `PointerEvent`
### fromEventDelta
Creates a [OffsetPair] from [PointerEvent.localDelta] and
 [PointerEvent.delta].

#### Parameters

- `event`: `PointerEvent`

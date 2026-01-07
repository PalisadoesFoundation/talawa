# Overview for `MapView`

## Description

Wrapper around a class that implements [Map] that only exposes `Map`
 members.

 A simple wrapper that delegates all `Map` members to the map provided in the
 constructor.

 Base for delegating map implementations like [UnmodifiableMapView].

## Dependencies

- Map

## Members

- **_map**: `Map&lt;K, V&gt;`
## Constructors

### Unnamed Constructor
Creates a view which forwards operations to [map].


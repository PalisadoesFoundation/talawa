# Overview for `UnmodifiableMapView`

## Description

View of a [Map] that disallow modifying the map.

 A wrapper around a `Map` that forwards all members to the map provided in
 the constructor, except for operations that modify the map.
 Modifying operations throw instead.

 ```dart
 final baseMap = <int, String>;
 final unmodifiableMapView = UnmodifiableMapView(baseMap);

 // Remove an entry from the original map.
 baseMap.remove(3);
 print(unmodifiableMapView); // 

 unmodifiableMapView.remove(1); // Throws.
 ```

## Dependencies

- MapView, _UnmodifiableMapMixin

## Constructors

### Unnamed Constructor



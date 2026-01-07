# Overview for `LinkedSet`

## Description

A linked hash set implementation based on ES6 Maps and Sets.

## Dependencies

- InternalSet

## Members

- **_map**: `dynamic`
  The backing store for this set.

 Keys that use identity equality are stored directly. For other types of
 keys, we first look them up (by hashCode) in the [_keyMap] map, then
 we lookup the key in this map.

- **_keyMap**: `dynamic`
  Items that use custom equality semantics.

 This maps from the item's hashCode to the canonical key, which is then
 used to lookup the item in [_map]. Keeping the data in our primary backing
 map gives us the ordering semantics required by [LinkedHashMap], while
 also providing convenient access to keys/values.

- **_modifications**: `int`

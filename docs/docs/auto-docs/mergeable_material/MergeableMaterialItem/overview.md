# Overview for `MergeableMaterialItem`

## Description

The base type for [MaterialSlice] and [MaterialGap].

 All [MergeableMaterialItem] objects need a [LocalKey].

## Members

- **key**: `LocalKey`
  The key for this item of the list.

 The key is used to match parts of the mergeable material from frame to
 frame so that state is maintained appropriately even as slices are added
 or removed.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.


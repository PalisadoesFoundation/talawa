# Overview for `MaterialSlice`

## Description

A class that can be used as a child to [MergeableMaterial]. It is a slice
 of [Material] that animates merging with other slices.

 All [MaterialSlice] objects need a [LocalKey].

## Dependencies

- MergeableMaterialItem

## Members

- **child**: `Widget`
  The contents of this slice.

 

- **color**: `Color?`
  Defines the color for the slice.

 By default, the value of [color] is [ThemeData.cardColor].

## Constructors

### Unnamed Constructor
Creates a slice of [Material] that's mergeable within a
 [MergeableMaterial].


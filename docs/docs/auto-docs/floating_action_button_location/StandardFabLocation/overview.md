# Overview for `StandardFabLocation`

## Description

A base class that simplifies building [FloatingActionButtonLocation]s when
 used with mixins [FabTopOffsetY], [FabFloatOffsetY], [FabDockedOffsetY],
 [FabStartOffsetX], [FabCenterOffsetX], [FabEndOffsetX], and [FabMiniOffsetAdjustment].

 A subclass of [FloatingActionButtonLocation] which implements its [getOffset] method
 using three other methods: [getOffsetX], [getOffsetY], and [isMini].

 Different mixins on this class override different methods, so that combining
 a set of mixins creates a floating action button location.

 For example: the location [FloatingActionButtonLocation.miniEndTop]
 is based on a class that extends [StandardFabLocation]
 with mixins [FabMiniOffsetAdjustment], [FabEndOffsetX], and [FabTopOffsetY].

 You can create your own subclass of [StandardFabLocation]
 to implement a custom [FloatingActionButtonLocation].

 
 This is an example of a user-defined [FloatingActionButtonLocation].

 The example shows a [Scaffold] with an [AppBar], a [BottomAppBar], and a
 [FloatingActionButton] using a custom [FloatingActionButtonLocation].

 The new [FloatingActionButtonLocation] is defined
 by extending [StandardFabLocation] with two mixins,
 [FabEndOffsetX] and [FabFloatOffsetY], and overriding the
 [getOffsetX] method to adjust the FAB's x-coordinate, creating a
 [FloatingActionButtonLocation] slightly different from
 [FloatingActionButtonLocation.endFloat].

 ** See code in examples/api/lib/material/floating_action_button_location/standard_fab_location.0.dart **
 

## Dependencies

- FloatingActionButtonLocation

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.


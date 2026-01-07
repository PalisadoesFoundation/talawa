# Overview for `AssetBundleImageProvider`

## Description

A subclass of [ImageProvider] that knows about [AssetBundle]s.

 This factors out the common logic of [AssetBundle]-based [ImageProvider]
 classes, simplifying what subclasses must implement to just [obtainKey].

## Dependencies

- ImageProvider

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.


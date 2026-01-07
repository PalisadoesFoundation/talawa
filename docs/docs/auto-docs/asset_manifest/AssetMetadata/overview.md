# Overview for `AssetMetadata`

## Description

Contains information about an asset.

## Members

- **targetDevicePixelRatio**: `double?`
  The device pixel ratio that this asset is most ideal for. This is determined
 by the name of the parent folder of the asset file. For example, if the
 parent folder is named "3.0x", the target device pixel ratio of that
 asset will be interpreted as 3.

 This will be null if the parent folder name is not a ratio value followed
 by an "x".

 See [Resolution-aware image assets](https://flutter.dev/to/resolution-aware-images)
 for more information.

- **key**: `String`
  The asset's key, which is the path to the asset specified in the pubspec.yaml
 file at build time.

- **main**: `bool`
  Whether or not this is a main asset. In other words, this is true if
 this asset is not a variant of another asset.

## Constructors

### Unnamed Constructor
Creates an object containing information about an asset.


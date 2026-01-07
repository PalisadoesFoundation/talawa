# Overview for `ImageConfiguration`

## Description

Configuration information passed to the [ImageProvider.resolve] method to
 select a specific image.

 See also:

  * [createLocalImageConfiguration], which creates an [ImageConfiguration]
    based on ambient configuration in a [Widget] environment.
  * [ImageProvider], which uses [ImageConfiguration] objects to determine
    which image to obtain.

## Members

- **bundle**: `AssetBundle?`
  The preferred [AssetBundle] to use if the [ImageProvider] needs one and
 does not have one already selected.

- **devicePixelRatio**: `double?`
  The device pixel ratio where the image will be shown.

- **locale**: `ui.Locale?`
  The language and region for which to select the image.

- **textDirection**: `TextDirection?`
  The reading direction of the language for which to select the image.

- **size**: `Size?`
  The size at which the image will be rendered.

- **platform**: `TargetPlatform?`
  The [TargetPlatform] for which assets should be used. This allows images
 to be specified in a platform-neutral fashion yet use different assets on
 different platforms, to match local conventions e.g. for color matching or
 shadows.

- **empty**: `ImageConfiguration`
  An image configuration that provides no additional information.

 Useful when resolving an [ImageProvider] without any context.

## Constructors

### Unnamed Constructor
Creates an object holding the configuration information for an [ImageProvider].

 All the arguments are optional. Configuration information is merely
 advisory and best-effort.


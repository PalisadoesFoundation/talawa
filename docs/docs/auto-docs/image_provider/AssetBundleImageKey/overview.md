# Overview for `AssetBundleImageKey`

## Description

Key for the image obtained by an [AssetImage] or [ExactAssetImage].

 This is used to identify the precise resource in the [imageCache].

## Members

- **bundle**: `AssetBundle`
  The bundle from which the image will be obtained.

 The image is obtained by calling [AssetBundle.load] on the given [bundle]
 using the key given by [name].

- **name**: `String`
  The key to use to obtain the resource from the [bundle]. This is the
 argument passed to [AssetBundle.load].

- **scale**: `double`
  The scale to place in the [ImageInfo] object of the image.

## Constructors

### Unnamed Constructor
Creates the key for an [AssetImage] or [AssetBundleImageProvider].


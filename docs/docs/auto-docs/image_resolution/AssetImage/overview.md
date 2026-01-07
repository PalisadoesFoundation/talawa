# Overview for `AssetImage`

## Description

Fetches an image from an [AssetBundle], having determined the exact image to
 use based on the context.

 Given a main asset and a set of variants, AssetImage chooses the most
 appropriate asset for the current context, based on the device pixel ratio
 and size given in the configuration passed to [resolve].

 To show a specific image from a bundle without any asset resolution, use an
 [AssetBundleImageProvider].

 ## Naming assets for matching with different pixel densities

 Main assets are presumed to match a nominal pixel ratio of 1.0. To specify
 assets targeting different pixel ratios, place the variant assets in
 the application bundle under subdirectories named in the form "Nx", where
 N is the nominal device pixel ratio for that asset.

 For example, suppose an application wants to use an icon named
 "heart.png". This icon has representations at 1.0 (the main icon), as well
 as 2.0 and 4.0 pixel ratios (variants). The asset bundle should then
 contain the following assets:

     heart.png
     2.0x/heart.png
     4.0x/heart.png

 On a device with a 1.0 device pixel ratio, the image chosen would be
 heart.png; on a device with a 2.0 device pixel ratio, the image chosen
 would be 2.0x/heart.png; on a device with a 4.0 device pixel ratio, the
 image chosen would be 4.0x/heart.png.

 On a device with a device pixel ratio that does not exactly match an
 available asset the "best match" is chosen. Which asset is the best depends
 on the screen. Low-resolution screens (those with device pixel ratio
 strictly less than 2.0) use a different matching algorithm from the
 high-resolution screen. Because in low-resolution screens the physical
 pixels are visible to the user upscaling artifacts (e.g. blurred edges) are
 more pronounced. Therefore, a higher resolution asset is chosen, if
 available. For higher-resolution screens, where individual physical pixels
 are not visible to the user, the asset variant with the pixel ratio that's
 the closest to the screen's device pixel ratio is chosen.

 For example, for a screen with device pixel ratio 1.25 the image chosen
 would be 2.0x/heart.png, even though heart.png (i.e. 1.0) is closer. This
 is because the screen is considered low-resolution. For a screen with
 device pixel ratio of 2.25 the image chosen would also be 2.0x/heart.png.
 This is because the screen is considered to be a high-resolution screen,
 and therefore upscaling a 2.0x image to 2.25 won't result in visible
 upscaling artifacts. However, for a screen with device-pixel ratio 3.25 the
 image chosen would be 4.0x/heart.png because it's closer to 4.0 than it is
 to 2.0.

 Choosing a higher-resolution image than necessary may waste significantly
 more memory if the difference between the screen device pixel ratio and
 the device pixel ratio of the image is high. To reduce memory usage,
 consider providing more variants of the image. In the example above adding
 a 3.0x/heart.png variant would improve memory usage for screens with device
 pixel ratios between 3.0 and 3.5.

 [ImageConfiguration] can be used to customize the selection of the image
 variant by setting [ImageConfiguration.devicePixelRatio] to value different
 from the default. The default value is derived from
 [MediaQueryData.devicePixelRatio] by [createLocalImageConfiguration].

 The directory level of the asset does not matter as long as the variants are
 at the equivalent level; that is, the following is also a valid bundle
 structure:

     icons/heart.png
     icons/1.5x/heart.png
     icons/2.0x/heart.png

 assets/icons/3.0x/heart.png would be a valid variant of
 assets/icons/heart.png.

 ## Fetching assets

 When fetching an image provided by the app itself, use the [assetName]
 argument to name the asset to choose. For instance, consider the structure
 above. First, the `pubspec.yaml` of the project should specify its assets in
 the `flutter` section:

 ```yaml
 flutter:
   assets:
     - icons/heart.png
 ```

 Then, to fetch the image, use:
 ```dart
 const AssetImage('icons/heart.png')
 ```

 

 The following shows the code required to write a widget that fully conforms
 to the [AssetImage] and [Widget] protocols. (It is essentially a
 bare-bones version of the [Image] widget made to work specifically for
 an [AssetImage].)

 ```dart
 class MyImage extends StatefulWidget 

 class _MyImageState extends State&lt;MyImage&gt; 
 ```
 

 ## Assets in packages

 To fetch an asset from a package, the [package] argument must be provided.
 For instance, suppose the structure above is inside a package called
 `my_icons`. Then to fetch the image, use:

 ```dart
 const AssetImage('icons/heart.png', package: 'my_icons')
 ```

 Assets used by the package itself should also be fetched using the [package]
 argument as above.

 If the desired asset is specified in the `pubspec.yaml` of the package, it
 is bundled automatically with the app. In particular, assets used by the
 package itself must be specified in its `pubspec.yaml`.

 A package can also choose to have assets in its 'lib/' folder that are not
 specified in its `pubspec.yaml`. In this case for those images to be
 bundled, the app has to specify which ones to include. For instance a
 package named `fancy_backgrounds` could have:

     lib/backgrounds/background1.png
     lib/backgrounds/background2.png
     lib/backgrounds/background3.png

 To include, say the first image, the `pubspec.yaml` of the app should specify
 it in the `assets` section:

 ```yaml
   assets:
     - packages/fancy_backgrounds/backgrounds/background1.png
 ```

 The `lib/` is implied, so it should not be included in the asset path.

 See also:

  * [Image.asset] for a shorthand of an [Image] widget backed by [AssetImage]
    when used without a scale.

## Dependencies

- AssetBundleImageProvider

## Members

- **assetName**: `String`
  The name of the main asset from the set of images to choose from. See the
 documentation for the [AssetImage] class itself for details.

- **bundle**: `AssetBundle?`
  The bundle from which the image will be obtained.

 If the provided [bundle] is null, the bundle provided in the
 [ImageConfiguration] passed to the [resolve] call will be used instead. If
 that is also null, the [rootBundle] is used.

 The image is obtained by calling [AssetBundle.load] on the given [bundle]
 using the key given by [keyName].

- **package**: `String?`
  The name of the package from which the image is included. See the
 documentation for the [AssetImage] class itself for details.

- **_naturalResolution**: `double`
## Constructors

### Unnamed Constructor
Creates an object that fetches an image from an asset bundle.

 The [assetName] argument should name the main asset from the set of images
 to choose from. The [package] argument must be non-null when fetching an
 asset that is included in package. See the documentation for the
 [AssetImage] class itself for details.


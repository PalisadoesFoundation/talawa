# Overview for `IconData`

## Description

A description of an icon fulfilled by a font glyph.

 See [Icons] for a number of predefined icons available for material
 design applications.

 In release builds, the Flutter tool will tree shake out of bundled fonts
 the code points (or instances of [IconData]) which are not referenced from
 Dart app code. See the [staticIconProvider] annotation for more details.

## Members

- **codePoint**: `int`
  The Unicode code point at which this icon is stored in the icon font.

- **fontFamily**: `String?`
  The font family from which the glyph for the [codePoint] will be selected.

- **fontPackage**: `String?`
  The name of the package from which the font family is included.

 The name is used by the [Icon] widget when configuring the [TextStyle] so
 that the given [fontFamily] is obtained from the appropriate asset.

 See also:

  * [TextStyle], which describes how to use fonts from other packages.

- **matchTextDirection**: `bool`
  Whether this icon should be automatically mirrored in right-to-left
 environments.

 The [Icon] widget respects this value by mirroring the icon when the
 [Directionality] is [TextDirection.rtl].

- **fontFamilyFallback**: `List&lt;String&gt;?`
  The ordered list of font families to fall back on when a glyph cannot be found in a higher priority font family.

 For more details, refer to the documentation of [TextStyle]

## Constructors

### Unnamed Constructor
Creates icon data.

 Rarely used directly. Instead, consider using one of the predefined icons
 like the [Icons] collection.

 The [fontFamily] argument is normally required when using custom icons.

 e.g. When using a [codePoint] from a `CustomIcons` font
 ```yaml
 fonts:
   - family: CustomIcons
     fonts:
       - asset: assets/fonts/CustomIcons.ttf
 ```
 `IconData` usages should specify `fontFamily: 'CustomIcons'`.

 The [fontPackage] argument must be non-null when using a font family that
 is included in a package. This is used when selecting the font.

 Instantiating non-const instances of this class in your app will
 mean the app cannot be built in release mode with icon tree-shaking (it
 need to be explicitly opted out at build time). See [staticIconProvider]
 for more context.


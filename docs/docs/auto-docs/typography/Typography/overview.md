# Overview for `Typography`

## Description

The color and geometry [TextTheme]s for Material apps.

 The text theme provided by the overall [Theme],
 [ThemeData.textTheme], is based on the current locale's
 [MaterialLocalizations.scriptCategory] and is created
 by merging a color text theme - [black] for
 [Brightness.light] themes and [white] for [Brightness.dark]
 themes - and a geometry text theme, one of [englishLike], [dense],
 or [tall], depending on the locale.

 To lookup the localized text theme use
 `Theme.of(context).textTheme`.

 The color text themes are [blackMountainView], [whiteMountainView],
 [blackCupertino], and [whiteCupertino]. The Mountain View theme [TextStyle]s
 are based on the Roboto fonts as used on Android. The Cupertino themes are
 based on the [San Francisco
 font](https://developer.apple.com/design/human-interface-guidelines/typography/)
 fonts as used by Apple on iOS.

 Two sets of geometry themes are provided: 2014 and 2018. The 2014 themes
 correspond to the original version of the Material Design spec and are
 the defaults. The 2018 themes correspond the second iteration of the
 specification and feature different font sizes, font weights, and
 letter spacing values.

 By default, [ThemeData.typography] is `Typography.material2014(platform:
 platform)` which uses [englishLike2014], [dense2014] and [tall2014]. To use
 the 2018 text theme geometries, specify a value using the [Typography.material2018]
 constructor:

 ```dart
 typography: Typography.material2018(platform: platform)
 ```

 See also:

  * <https://material.io/design/typography/>
  * <https://m3.material.io/styles/typography>

## Dependencies

- Diagnosticable

## Members

- **black**: `TextTheme`
  A Material Design text theme with dark glyphs.

 This [TextTheme] should provide color but not geometry (font size,
 weight, etc). A text theme's geometry depends on the locale. To look
 up a localized [TextTheme], use the overall [Theme], for example:
 `Theme.of(context).textTheme`.

 The [englishLike], [dense], and [tall] text theme's provide locale-specific
 geometry.

- **white**: `TextTheme`
  A Material Design text theme with light glyphs.

 This [TextTheme] provides color but not geometry (font size, weight, etc).
 A text theme's geometry depends on the locale. To look up a localized
 [TextTheme], use the overall [Theme], for example:
 `Theme.of(context).textTheme`.

 The [englishLike], [dense], and [tall] text theme's provide locale-specific
 geometry.

- **englishLike**: `TextTheme`
  Defines text geometry for `ScriptCategory.englishLike` scripts, such as
 English, French, Russian, etc.

 This text theme is merged with either [black] or [white], depending
 on the overall [ThemeData.brightness], when the current locale's
 [MaterialLocalizations.scriptCategory] is `ScriptCategory.englishLike`.

 To look up a localized [TextTheme], use the overall [Theme], for
 example: `Theme.of(context).textTheme`.

- **dense**: `TextTheme`
  Defines text geometry for dense scripts, such as Chinese, Japanese
 and Korean.

 This text theme is merged with either [black] or [white], depending
 on the overall [ThemeData.brightness], when the current locale's
 [MaterialLocalizations.scriptCategory] is `ScriptCategory.dense`.

 To look up a localized [TextTheme], use the overall [Theme], for
 example: `Theme.of(context).textTheme`.

- **tall**: `TextTheme`
  Defines text geometry for tall scripts, such as Farsi, Hindi, and Thai.

 This text theme is merged with either [black] or [white], depending
 on the overall [ThemeData.brightness], when the current locale's
 [MaterialLocalizations.scriptCategory] is `ScriptCategory.tall`.

 To look up a localized [TextTheme], use the overall [Theme], for
 example: `Theme.of(context).textTheme`.

- **blackMountainView**: `TextTheme`
  A Material Design text theme with dark glyphs based on Roboto.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

- **whiteMountainView**: `TextTheme`
  A Material Design text theme with light glyphs based on Roboto.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

- **blackRedmond**: `TextTheme`
  A Material Design text theme with dark glyphs based on Segoe UI.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

- **whiteRedmond**: `TextTheme`
  A Material Design text theme with light glyphs based on Segoe UI.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

- **_helsinkiFontFallbacks**: `List&lt;String&gt;`
- **blackHelsinki**: `TextTheme`
  A Material Design text theme with dark glyphs based on Roboto, with
 fallback fonts that are likely (but not guaranteed) to be installed on
 Linux.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

- **whiteHelsinki**: `TextTheme`
  A Material Design text theme with light glyphs based on Roboto, with fallbacks of DejaVu Sans, Liberation Sans and Arial.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

- **blackCupertino**: `TextTheme`
  A Material Design text theme with dark glyphs based on San Francisco.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

 This theme uses the iOS version of the font names.

- **whiteCupertino**: `TextTheme`
  A Material Design text theme with light glyphs based on San Francisco.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

 This theme uses the iOS version of the font names.

- **blackRedwoodCity**: `TextTheme`
  A Material Design text theme with dark glyphs based on San Francisco.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

 This theme uses the macOS version of the font names.

- **whiteRedwoodCity**: `TextTheme`
  A Material Design text theme with light glyphs based on San Francisco.

 This [TextTheme] provides color but not geometry (font size, weight, etc).

 This theme uses the macOS version of the font names.

- **englishLike2014**: `TextTheme`
  Defines text geometry for `ScriptCategory.englishLike` scripts, such as
 English, French, Russian, etc.

- **englishLike2018**: `TextTheme`
  Defines text geometry for `ScriptCategory.englishLike` scripts, such as
 English, French, Russian, etc.

 The font sizes, weights, and letter spacings in this version match the
 [2018 Material Design specification](https://material.io/go/design-typography#typography-styles).

- **dense2014**: `TextTheme`
  Defines text geometry for dense scripts, such as Chinese, Japanese
 and Korean.

- **dense2018**: `TextTheme`
  Defines text geometry for dense scripts, such as Chinese, Japanese
 and Korean.

 The font sizes, weights, and letter spacings in this version match the
 2018 [Material Design specification](https://material.io/go/design-typography#typography-styles).

- **tall2014**: `TextTheme`
  Defines text geometry for tall scripts, such as Farsi, Hindi, and Thai.

- **tall2018**: `TextTheme`
  Defines text geometry for tall scripts, such as Farsi, Hindi, and Thai.

 The font sizes, weights, and letter spacings in this version match the
 2018 [Material Design specification](https://material.io/go/design-typography#typography-styles).

- **englishLike2021**: `TextTheme`
  Defines text geometry for `ScriptCategory.englishLike` scripts, such as
 English, French, Russian, etc.

 The font sizes, weights, and letter spacings in this version match the
 [2021 Material Design 3 specification](https://m3.material.io/styles/typography/overview).

- **dense2021**: `TextTheme`
  Defines text geometry for dense scripts, such as Chinese, Japanese
 and Korean.

 The Material Design 3 specification does not include 'dense' text themes,
 so this is just here to be consistent with the API.

- **tall2021**: `TextTheme`
  Defines text geometry for tall scripts, such as Farsi, Hindi, and Thai.

 The Material Design 3 specification does not include 'tall' text themes,
 so this is just here to be consistent with the API.

## Constructors

### Unnamed Constructor
Creates a typography instance.

 This constructor is identical to [Typography.material2018].

### material2014
Creates a typography instance using Material Design's 2014 defaults.

 If [platform] is [TargetPlatform.iOS] or [TargetPlatform.macOS], the
 default values for [black] and [white] are [blackCupertino] and
 [whiteCupertino] respectively. Otherwise they are [blackMountainView] and
 [whiteMountainView]. If [platform] is null then both [black] and [white]
 must be specified.

 The default values for [englishLike], [dense], and [tall] are
 [englishLike2014], [dense2014], and [tall2014].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### material2018
Creates a typography instance using Material Design's 2018 defaults.

 If [platform] is [TargetPlatform.iOS] or [TargetPlatform.macOS], the
 default values for [black] and [white] are [blackCupertino] and
 [whiteCupertino] respectively. Otherwise they are [blackMountainView] and
 [whiteMountainView]. If [platform] is null then both [black] and [white]
 must be specified.

 The default values for [englishLike], [dense], and [tall] are
 [englishLike2018], [dense2018], and [tall2018].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### material2021
Creates a typography instance using Material Design 3 2021 defaults.

 If [platform] is [TargetPlatform.iOS] or [TargetPlatform.macOS], the
 default values for [black] and [white] are [blackCupertino] and
 [whiteCupertino] respectively. Otherwise they are [blackMountainView] and
 [whiteMountainView]. If [platform] is null then both [black] and [white]
 must be specified.

 The default values for [englishLike], [dense], and [tall] are
 [englishLike2021], [dense2021], and [tall2021].

 See also:
  * <https://m3.material.io/styles/typography>

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### _withPlatform


#### Parameters

- `platform`: `TargetPlatform?`
- `black`: `TextTheme?`
- `white`: `TextTheme?`
- `englishLike`: `TextTheme`
- `dense`: `TextTheme`
- `tall`: `TextTheme`
### _


#### Parameters

- `black`: `dynamic`
- `white`: `dynamic`
- `englishLike`: `dynamic`
- `dense`: `dynamic`
- `tall`: `dynamic`

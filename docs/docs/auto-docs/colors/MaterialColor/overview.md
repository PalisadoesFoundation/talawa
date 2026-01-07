# Overview for `MaterialColor`

## Description

Defines a single color as well a color swatch with ten shades of the color.

 The color's shades are referred to by index. The greater the index, the
 darker the color. There are 10 valid indices: 50, 100, 200, ..., 900.
 The value of this color should the same the value of index 500 and [shade500].

 ## Updating to [ColorScheme]

 The [ColorScheme] is preferred for
 representing colors in applications that are configured
 for Material 3 (see [ThemeData.useMaterial3]).
 For more information on colors in Material 3 see
 the spec at <https://m3.material.io/styles/color/the-color-system>.


 In Material 3, colors are represented using color roles and
 corresponding tokens. Each property in the [ColorScheme] class
 represents one color role as defined in the spec above.
 

 ### Material 3 Colors in Flutter


 Flutter's Material widgets can be assigned colors at the widget level
 using widget properties,
 or at the app level using theme classes.

 For example, you can set the background of the [AppBar] by
 setting the [AppBar.backgroundColor] to a specific [Color] value.

 To globally set the AppBar background color for your app, you
 can set the [ThemeData.appBarTheme] property for your [MaterialApp]
 using the [ThemeData] class. You can also override
 the default appearance of all the [AppBar]s in a widget subtree by
 placing the [AppBarTheme] at the root of the subtree.

 Alternatively, you can set the [ThemeData.colorScheme] property
 to a custom [ColorScheme]. This creates a unified [ColorScheme] to be
 used across the app. The [AppBar.backgroundColor] uses the
 [ColorScheme.surface] by default.


 ### Migrating from [MaterialColor] to [ColorScheme]

 In most cases, there are new properties in Flutter widgets that
 accept a [ColorScheme] instead of a [MaterialColor].

 For example, you may have previously constructed a [ThemeData]
 using a primarySwatch:

 ```dart
 ThemeData(
   primarySwatch: Colors.amber,
 )
 ```

 In Material 3, you can use the [ColorScheme] class to
 construct a [ThemeData] with the same color palette
 by using the [ColorScheme.fromSeed] constructor:

  ```dart
 ThemeData(
   colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
 )
 ```

 The [ColorScheme.fromSeed] constructor
 will generate a set of tonal palettes,
 which are used to create the color scheme.

 Alternatively you can use the [ColorScheme.fromSwatch] constructor:

 ```dart
 ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
 )
 ```

 The [ColorScheme.fromSwatch] constructor will
 create the color scheme directly from the specific
 color values used in the [MaterialColor].


 See also:

  * [Colors], which defines all of the standard material colors.

## Dependencies

- ColorSwatch

## Constructors

### Unnamed Constructor
Creates a color swatch with a variety of shades.

 The `primary` argument should be the 32 bit ARGB value of one of the
 values in the swatch, as would be passed to the [Color.new] constructor
 for that same color, and as is exposed by [value]. (This is distinct from
 the specific index of the color in the swatch.)


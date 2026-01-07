# Overview for `Colors`

## Description

[Color] and [ColorSwatch] constants which represent Material design's
 [color palette](https://material.io/design/color/).

 Instead of using an absolute color from these palettes, consider using
 [Theme.of] to obtain the local [ThemeData.colorScheme], which defines
 the colors that most of the Material components use by default.


 Most swatches have colors from 100 to 900 in increments of one hundred, plus
 the color 50. The smaller the number, the more pale the color. The greater
 the number, the darker the color. The accent swatches (e.g. [redAccent]) only
 have the values 100, 200, 400, and 700.

 In addition, a series of blacks and whites with common opacities are
 available. For example, [black54] is a pure black with 54% opacity.

 

 To select a specific color from one of the swatches, index into the swatch
 using an integer for the specific color desired, as follows:

 ```dart
 Color selection = Colors.green[400]!; // Selects a mid-range green.
 ```
 
 

 Each [ColorSwatch] constant is a color and can used directly. For example:

 ```dart
 Container(
   color: Colors.blue, // same as Colors.blue[500] or Colors.blue.shade500
 )
 ```
 

 ## Color palettes

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueGrey.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.brown.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.grey.png)

 ## Blacks and whites

 These colors are identified by their transparency. The low transparency
 levels (e.g. [Colors.white12] and [Colors.white10]) are very hard to see and
 should be avoided in general. They are intended for very subtle effects.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 The [Colors.transparent] color isn't shown here because it is entirely
 invisible!

 See also:

  * Cookbook: [Use themes to share colors and font styles](https://docs.flutter.dev/cookbook/design/themes)

## Members

- **transparent**: `Color`
  Completely invisible.

- **black**: `Color`
  Completely opaque black.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)

 See also:

  * [black87], [black54], [black45], [black38], [black26], [black12], which
    are variants on this color but with different opacities.
  * [white], a solid white color.
  * [transparent], a fully-transparent color.

- **black87**: `Color`
  Black with 87% opacity.

 This is a good contrasting color for text in light themes.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)

 See also:

  * [Typography.black], which uses this color for its text styles.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [black], [black54], [black45], [black38], [black26], [black12], which
    are variants on this color but with different opacities.

- **black54**: `Color`
  Black with 54% opacity.

 This is a color commonly used for headings in light themes. It's also used
 as the mask color behind dialogs.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)

 See also:

  * [Typography.black], which uses this color for its text styles.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [black], [black87], [black45], [black38], [black26], [black12], which
    are variants on this color but with different opacities.

- **black45**: `Color`
  Black with 45% opacity.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)

 See also:

  * [black], [black87], [black54], [black38], [black26], [black12], which
    are variants on this color but with different opacities.

- **black38**: `Color`
  Black with 38% opacity.

 For light themes, i.e. when the Theme's [ThemeData.brightness] is
 [Brightness.light], this color is used for disabled icons and for
 placeholder text in [DataTable].

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)

 See also:

  * [black], [black87], [black54], [black45], [black26], [black12], which
    are variants on this color but with different opacities.

- **black26**: `Color`
  Black with 26% opacity.

 Used for disabled radio buttons and the text of disabled flat buttons in light themes.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)

 See also:

  * [ThemeData.disabledColor], which uses this color by default in light themes.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [black], [black87], [black54], [black45], [black38], [black12], which
    are variants on this color but with different opacities.

- **black12**: `Color`
  Black with 12% opacity.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)

 Used for the background of disabled raised buttons in light themes.

 See also:

  * [black], [black87], [black54], [black45], [black38], [black26], which
    are variants on this color but with different opacities.

- **white**: `Color`
  Completely opaque white.

 This is a good contrasting color for the [ThemeData.primaryColor] in the
 dark theme. See [ThemeData.brightness].

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 See also:

  * [Typography.white], which uses this color for its text styles.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [white70], [white60], [white54], [white38], [white30], [white12],
    [white10], which are variants on this color but with different
    opacities.
  * [black], a solid black color.
  * [transparent], a fully-transparent color.

- **white70**: `Color`
  White with 70% opacity.

 This is a color commonly used for headings in dark themes.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 See also:

  * [Typography.white], which uses this color for its text styles.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [white], [white60], [white54], [white38], [white30], [white12],
    [white10], which are variants on this color but with different
    opacities.

- **white60**: `Color`
  White with 60% opacity.

 Used for medium-emphasis text and hint text when [ThemeData.brightness] is
 set to [Brightness.dark].

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 See also:

  * [ExpandIcon], which uses this color for dark themes.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [white], [white54], [white30], [white38], [white12], [white10], which
    are variants on this color but with different opacities.

- **white54**: `Color`
  White with 54% opacity.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 See also:

  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [white], [white60], [white38], [white30], [white12], [white10], which
    are variants on this color but with different opacities.

- **white38**: `Color`
  White with 38% opacity.

 Used for disabled radio buttons and the text of disabled flat buttons in dark themes.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 See also:

  * [ThemeData.disabledColor], which uses this color by default in dark themes.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [white], [white60], [white54], [white70], [white30], [white12],
    [white10], which are variants on this color but with different
    opacities.

- **white30**: `Color`
  White with 30% opacity.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 See also:

  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.
  * [white], [white60], [white54], [white70], [white38], [white12],
    [white10], which are variants on this color but with different
    opacities.

- **white24**: `Color`
  White with 24% opacity.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 Used for the splash color for filled buttons.

 See also:

  * [white], [white60], [white54], [white70], [white38], [white30],
    [white10], which are variants on this color
    but with different opacities.

- **white12**: `Color`
  White with 12% opacity.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 Used for the background of disabled raised buttons in dark themes.

 See also:

  * [white], [white60], [white54], [white70], [white38], [white30],
    [white10], which are variants on this color but with different
    opacities.

- **white10**: `Color`
  White with 10% opacity.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)

 See also:

  * [white], [white60], [white54], [white70], [white38], [white30],
    [white12], which are variants on this color
    but with different opacities.
  * [transparent], a fully-transparent color, not far from this one.

- **red**: `MaterialColor`
  The red primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.red[400],
 )
 ```
 

 See also:

  * [redAccent], the corresponding accent colors.
  * [deepOrange] and [pink], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_redPrimaryValue**: `int`
- **redAccent**: `MaterialAccentColor`
  The red accent swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.redAccent[400],
 )
 ```
 

 See also:

  * [red], the corresponding primary colors.
  * [deepOrangeAccent] and [pinkAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_redAccentValue**: `int`
- **pink**: `MaterialColor`
  The pink primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.pink[400],
 )
 ```
 

 See also:

  * [pinkAccent], the corresponding accent colors.
  * [red] and [purple], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_pinkPrimaryValue**: `int`
- **pinkAccent**: `MaterialAccentColor`
  The pink accent color swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.pinkAccent[400],
 )
 ```
 

 See also:

  * [pink], the corresponding primary colors.
  * [redAccent] and [purpleAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_pinkAccentPrimaryValue**: `int`
- **purple**: `MaterialColor`
  The purple primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.purple[400],
 )
 ```
 

 See also:

  * [purpleAccent], the corresponding accent colors.
  * [deepPurple] and [pink], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_purplePrimaryValue**: `int`
- **purpleAccent**: `MaterialAccentColor`
  The purple accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.purpleAccent[400],
 )
 ```
 

 See also:

  * [purple], the corresponding primary colors.
  * [deepPurpleAccent] and [pinkAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_purpleAccentPrimaryValue**: `int`
- **deepPurple**: `MaterialColor`
  The deep purple primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.deepPurple[400],
 )
 ```
 

 See also:

  * [deepPurpleAccent], the corresponding accent colors.
  * [purple] and [indigo], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_deepPurplePrimaryValue**: `int`
- **deepPurpleAccent**: `MaterialAccentColor`
  The deep purple accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.deepPurpleAccent[400],
 )
 ```
 

 See also:

  * [deepPurple], the corresponding primary colors.
  * [purpleAccent] and [indigoAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_deepPurpleAccentPrimaryValue**: `int`
- **indigo**: `MaterialColor`
  The indigo primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.indigo[400],
 )
 ```
 

 See also:

  * [indigoAccent], the corresponding accent colors.
  * [blue] and [deepPurple], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_indigoPrimaryValue**: `int`
- **indigoAccent**: `MaterialAccentColor`
  The indigo accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.indigoAccent[400],
 )
 ```
 

 See also:

  * [indigo], the corresponding primary colors.
  * [blueAccent] and [deepPurpleAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_indigoAccentPrimaryValue**: `int`
- **blue**: `MaterialColor`
  The blue primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueGrey.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.blue[400],
 )
 ```
 

 See also:

  * [blueAccent], the corresponding accent colors.
  * [indigo], [lightBlue], and [blueGrey], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_bluePrimaryValue**: `int`
- **blueAccent**: `MaterialAccentColor`
  The blue accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.blueAccent[400],
 )
 ```
 

 See also:

  * [blue], the corresponding primary colors.
  * [indigoAccent] and [lightBlueAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_blueAccentPrimaryValue**: `int`
- **lightBlue**: `MaterialColor`
  The light blue primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.lightBlue[400],
 )
 ```
 

 See also:

  * [lightBlueAccent], the corresponding accent colors.
  * [blue] and [cyan], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_lightBluePrimaryValue**: `int`
- **lightBlueAccent**: `MaterialAccentColor`
  The light blue accent swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.lightBlueAccent[400],
 )
 ```
 

 See also:

  * [lightBlue], the corresponding primary colors.
  * [blueAccent] and [cyanAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_lightBlueAccentPrimaryValue**: `int`
- **cyan**: `MaterialColor`
  The cyan primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueGrey.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.cyan[400],
 )
 ```
 

 See also:

  * [cyanAccent], the corresponding accent colors.
  * [lightBlue], [teal], and [blueGrey], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_cyanPrimaryValue**: `int`
- **cyanAccent**: `MaterialAccentColor`
  The cyan accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.cyanAccent[400],
 )
 ```
 

 See also:

  * [cyan], the corresponding primary colors.
  * [lightBlueAccent] and [tealAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_cyanAccentPrimaryValue**: `int`
- **teal**: `MaterialColor`
  The teal primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.teal[400],
 )
 ```
 

 See also:

  * [tealAccent], the corresponding accent colors.
  * [green] and [cyan], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_tealPrimaryValue**: `int`
- **tealAccent**: `MaterialAccentColor`
  The teal accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.tealAccent[400],
 )
 ```
 

 See also:

  * [teal], the corresponding primary colors.
  * [greenAccent] and [cyanAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_tealAccentPrimaryValue**: `int`
- **green**: `MaterialColor`
  The green primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.green[400],
 )
 ```
 

 See also:

  * [greenAccent], the corresponding accent colors.
  * [teal], [lightGreen], and [lime], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_greenPrimaryValue**: `int`
- **greenAccent**: `MaterialAccentColor`
  The green accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.greenAccent[400],
 )
 ```
 

 See also:

  * [green], the corresponding primary colors.
  * [tealAccent], [lightGreenAccent], and [limeAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_greenAccentPrimaryValue**: `int`
- **lightGreen**: `MaterialColor`
  The light green primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.lightGreen[400],
 )
 ```
 

 See also:

  * [lightGreenAccent], the corresponding accent colors.
  * [green] and [lime], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_lightGreenPrimaryValue**: `int`
- **lightGreenAccent**: `MaterialAccentColor`
  The light green accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.lightGreenAccent[400],
 )
 ```
 

 See also:

  * [lightGreen], the corresponding primary colors.
  * [greenAccent] and [limeAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_lightGreenAccentPrimaryValue**: `int`
- **lime**: `MaterialColor`
  The lime primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.lime[400],
 )
 ```
 

 See also:

  * [limeAccent], the corresponding accent colors.
  * [lightGreen] and [yellow], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_limePrimaryValue**: `int`
- **limeAccent**: `MaterialAccentColor`
  The lime accent primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.limeAccent[400],
 )
 ```
 

 See also:

  * [lime], the corresponding primary colors.
  * [lightGreenAccent] and [yellowAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_limeAccentPrimaryValue**: `int`
- **yellow**: `MaterialColor`
  The yellow primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.yellow[400],
 )
 ```
 

 See also:

  * [yellowAccent], the corresponding accent colors.
  * [lime] and [amber], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_yellowPrimaryValue**: `int`
- **yellowAccent**: `MaterialAccentColor`
  The yellow accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.yellowAccent[400],
 )
 ```
 

 See also:

  * [yellow], the corresponding primary colors.
  * [limeAccent] and [amberAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_yellowAccentPrimaryValue**: `int`
- **amber**: `MaterialColor`
  The amber primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.amber[400],
 )
 ```
 

 See also:

  * [amberAccent], the corresponding accent colors.
  * [yellow] and [orange], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_amberPrimaryValue**: `int`
- **amberAccent**: `MaterialAccentColor`
  The amber accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.amberAccent[400],
 )
 ```
 

 See also:

  * [amber], the corresponding primary colors.
  * [yellowAccent] and [orangeAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_amberAccentPrimaryValue**: `int`
- **orange**: `MaterialColor`
  The orange primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.brown.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.orange[400],
 )
 ```
 

 See also:

  * [orangeAccent], the corresponding accent colors.
  * [amber], [deepOrange], and [brown], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_orangePrimaryValue**: `int`
- **orangeAccent**: `MaterialAccentColor`
  The orange accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.orangeAccent[400],
 )
 ```
 

 See also:

  * [orange], the corresponding primary colors.
  * [amberAccent] and [deepOrangeAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_orangeAccentPrimaryValue**: `int`
- **deepOrange**: `MaterialColor`
  The deep orange primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.brown.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.deepOrange[400],
 )
 ```
 

 See also:

  * [deepOrangeAccent], the corresponding accent colors.
  * [orange], [red], and [brown], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_deepOrangePrimaryValue**: `int`
- **deepOrangeAccent**: `MaterialAccentColor`
  The deep orange accent color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.deepOrangeAccent[400],
 )
 ```
 

 See also:

  * [deepOrange], the corresponding primary colors.
  * [orangeAccent] [redAccent], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_deepOrangeAccentPrimaryValue**: `int`
- **brown**: `MaterialColor`
  The brown primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.brown.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueGrey.png)

 This swatch has no corresponding accent color and swatch.

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.brown[400],
 )
 ```
 

 See also:

  * [orange] and [blueGrey], vaguely similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_brownPrimaryValue**: `int`
- **grey**: `MaterialColor`
  The grey primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.grey.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueGrey.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.brown.png)

 This swatch has no corresponding accent swatch.

 This swatch, in addition to the values 50 and 100 to 900 in 100
 increments, also features the special values 350 and 850. The 350 value is
 used for raised button while pressed in light themes, and 850 is used for
 the background color of the dark theme. See [ThemeData.brightness].

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.grey[400],
 )
 ```
 

 See also:

  * [blueGrey] and [brown], somewhat similar colors.
  * [black], [black87], [black54], [black45], [black38], [black26], [black12], which
    provide a different approach to showing shades of grey.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_greyPrimaryValue**: `int`
- **blueGrey**: `MaterialColor`
  The blue-grey primary color and swatch.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueGrey.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.grey.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)

 This swatch has no corresponding accent swatch.

 

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.blueGrey[400],
 )
 ```
 

 See also:

  * [grey], [cyan], and [blue], similar colors.
  * [Theme.of], which allows you to select colors from the current theme
    rather than hard-coding colors in your build methods.

- **_blueGreyPrimaryValue**: `int`
- **primaries**: `List&lt;MaterialColor&gt;`
  The Material Design primary color swatches, excluding grey.

- **accents**: `List&lt;MaterialAccentColor&gt;`
  The Material Design accent color swatches.


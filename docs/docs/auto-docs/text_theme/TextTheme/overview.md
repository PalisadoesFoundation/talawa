# Overview for `TextTheme`

## Description

Material design text theme.

 Definitions for the various typographical styles found in Material Design
 (e.g., labelLarge, bodySmall). Rather than creating a [TextTheme] directly,
 you can obtain an instance as [Typography.black] or [Typography.white].

 To obtain the current text theme, call [TextTheme.of] with the current
 [BuildContext]. This is equivalent to calling [Theme.of] and reading
 the [ThemeData.textTheme] property.

 The names of the TextTheme properties match this table from the
 [Material Design spec](https://m3.material.io/styles/typography/tokens).

 ![](https://lh3.googleusercontent.com/Yvngs5mQSjXa_9T4X3JDucO62c5hdZHPDa7qeRH6DsJQvGr_q7EBrTkhkPiQd9OeR1v_Uk38Cjd9nUpP3nevDyHpKWuXSfQ1Gq78bOnBN7sr=s0)

 The Material Design typography scheme was significantly changed in the
 current (2021) version of the specification
 ([https://m3.material.io/styles/typography/tokens](https://m3.material.io/styles/typography/tokens)).

 The **2021** spec has fifteen text styles:

 | NAME           | SIZE |  HEIGHT |  WEIGHT |  SPACING |             |
 |----------------|------|---------|---------|----------|-------------|
 | displayLarge   | 57.0 |   64.0  | regular | -0.25    |             |
 | displayMedium  | 45.0 |   52.0  | regular |  0.0     |             |
 | displaySmall   | 36.0 |   44.0  | regular |  0.0     |             |
 | headlineLarge  | 32.0 |   40.0  | regular |  0.0     |             |
 | headlineMedium | 28.0 |   36.0  | regular |  0.0     |             |
 | headlineSmall  | 24.0 |   32.0  | regular |  0.0     |             |
 | titleLarge     | 22.0 |   28.0  | regular |  0.0     |             |
 | titleMedium    | 16.0 |   24.0  | medium  |  0.15    |             |
 | titleSmall     | 14.0 |   20.0  | medium  |  0.1     |             |
 | bodyLarge      | 16.0 |   24.0  | regular |  0.5     |             |
 | bodyMedium     | 14.0 |   20.0  | regular |  0.25    |             |
 | bodySmall      | 12.0 |   16.0  | regular |  0.4     |             |
 | labelLarge     | 14.0 |   20.0  | medium  |  0.1     |             |
 | labelMedium    | 12.0 |   16.0  | medium  |  0.5     |             |
 | labelSmall     | 11.0 |   16.0  | medium  |  0.5     |             |

 ...where "regular" is `FontWeight.w400` and "medium" is `FontWeight.w500`.

 The names of the 2018 TextTheme properties match this table from the
 [Material Design spec](https://material.io/design/typography/the-type-system.html#type-scale)
 with a few exceptions: the styles called H1-H6 in the spec are
 displayLarge-titleLarge in the API chart, body1,body2 are called
 bodyLarge and bodyMedium, caption is now bodySmall, button is labelLarge,
 and overline is now labelSmall.

 The **2018** spec has thirteen text styles:

 | NAME           | SIZE |  WEIGHT |  SPACING |             |
 |----------------|------|---------|----------|-------------|
 | displayLarge   | 96.0 | light   | -1.5     |             |
 | displayMedium  | 60.0 | light   | -0.5     |             |
 | displaySmall   | 48.0 | regular |  0.0     |             |
 | headlineMedium | 34.0 | regular |  0.25    |             |
 | headlineSmall  | 24.0 | regular |  0.0     |             |
 | titleLarge     | 20.0 | medium  |  0.15    |             |
 | titleMedium    | 16.0 | regular |  0.15    |             |
 | titleSmall     | 14.0 | medium  |  0.1     |             |
 | bodyLarge      | 16.0 | regular |  0.5     |             |
 | bodyMedium     | 14.0 | regular |  0.25    |             |
 | bodySmall      | 12.0 | regular |  0.4     |             |
 | labelLarge     | 14.0 | medium  |  1.25    |             |
 | labelSmall     | 10.0 | regular |  1.5     |             |

 ...where "light" is `FontWeight.w300`, "regular" is `FontWeight.w400` and
 "medium" is `FontWeight.w500`.

 By default, text styles are initialized to match the 2018 Material Design
 specification as listed above. To provide backwards compatibility, the 2014
 specification is also available.

 To explicitly configure a [Theme] for the 2018 sizes, weights, and letter
 spacings, you can initialize its [ThemeData.typography] value using
 [Typography.material2018]. The [Typography] constructor defaults to this
 configuration. To configure a [Theme] for the 2014 sizes, weights, and letter
 spacings, initialize its [ThemeData.typography] value using
 [Typography.material2014].

 See also:

  * [Typography], the class that generates [TextTheme]s appropriate for a platform.
  * [Theme], for other aspects of a Material Design application that can be
    globally adjusted, such as the color scheme.
  * <https://material.io/design/typography/>

## Dependencies

- Diagnosticable

## Members

- **displayLarge**: `TextStyle?`
  Largest of the display styles.

 As the largest text on the screen, display styles are reserved for short,
 important text or numerals. They work best on large screens.

- **displayMedium**: `TextStyle?`
  Middle size of the display styles.

 As the largest text on the screen, display styles are reserved for short,
 important text or numerals. They work best on large screens.

- **displaySmall**: `TextStyle?`
  Smallest of the display styles.

 As the largest text on the screen, display styles are reserved for short,
 important text or numerals. They work best on large screens.

- **headlineLarge**: `TextStyle?`
  Largest of the headline styles.

 Headline styles are smaller than display styles. They're best-suited for
 short, high-emphasis text on smaller screens.

- **headlineMedium**: `TextStyle?`
  Middle size of the headline styles.

 Headline styles are smaller than display styles. They're best-suited for
 short, high-emphasis text on smaller screens.

- **headlineSmall**: `TextStyle?`
  Smallest of the headline styles.

 Headline styles are smaller than display styles. They're best-suited for
 short, high-emphasis text on smaller screens.

- **titleLarge**: `TextStyle?`
  Largest of the title styles.

 Titles are smaller than headline styles and should be used for shorter,
 medium-emphasis text.

- **titleMedium**: `TextStyle?`
  Middle size of the title styles.

 Titles are smaller than headline styles and should be used for shorter,
 medium-emphasis text.

- **titleSmall**: `TextStyle?`
  Smallest of the title styles.

 Titles are smaller than headline styles and should be used for shorter,
 medium-emphasis text.

- **bodyLarge**: `TextStyle?`
  Largest of the body styles.

 Body styles are used for longer passages of text.

- **bodyMedium**: `TextStyle?`
  Middle size of the body styles.

 Body styles are used for longer passages of text.

 The default text style for [Material].

- **bodySmall**: `TextStyle?`
  Smallest of the body styles.

 Body styles are used for longer passages of text.

- **labelLarge**: `TextStyle?`
  Largest of the label styles.

 Label styles are smaller, utilitarian styles, used for areas of the UI
 such as text inside of components or very small supporting text in the
 content body, like captions.

 Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].

- **labelMedium**: `TextStyle?`
  Middle size of the label styles.

 Label styles are smaller, utilitarian styles, used for areas of the UI
 such as text inside of components or very small supporting text in the
 content body, like captions.

- **labelSmall**: `TextStyle?`
  Smallest of the label styles.

 Label styles are smaller, utilitarian styles, used for areas of the UI
 such as text inside of components or very small supporting text in the
 content body, like captions.

## Constructors

### Unnamed Constructor
Creates a text theme that uses the given values.

 Rather than creating a new text theme, consider using [Typography.black]
 or [Typography.white], which implement the typography styles in the
 Material Design specification:

 <https://material.io/design/typography/#type-scale>

 If you do decide to create your own text theme, consider using one of
 those predefined themes as a starting point for [copyWith] or [apply].

 The 2018 styles cannot be mixed with the 2021 styles. Only one or the
 other is allowed in this constructor. The 2018 styles are deprecated and
 will eventually be removed.


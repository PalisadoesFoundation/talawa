# Overview for `GlobalWidgetsLocalizations`

## Description

Localized values for widgets.

 ## Supported languages

 This class supports locales with the following [Locale.languageCode]s:

 

 This list is available programmatically via [kWidgetsSupportedLanguages].

 Besides localized strings, this class also maps [Locale] to [textDirection].
 All locales are [TextDirection.ltr] except for locales with the following
 [Locale.languageCode] values, which are [TextDirection.rtl]:

   * ar - Arabic
   * fa - Farsi
   * he - Hebrew
   * ps - Pashto
   * sd - Sindhi
   * ur - Urdu

## Dependencies

- WidgetsLocalizations

## Members

- **textDirection**: `TextDirection`
- **delegate**: `LocalizationsDelegate&lt;WidgetsLocalizations&gt;`
  A [LocalizationsDelegate] for [WidgetsLocalizations].

 Most internationalized apps will use [GlobalMaterialLocalizations.delegates]
 as the value of [MaterialApp.localizationsDelegates] to include
 the localizations for both the material and widget libraries.

## Constructors

### Unnamed Constructor
Construct an object that defines the localized values for the widgets
 library for the given [textDirection].


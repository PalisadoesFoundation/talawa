# Overview for `GlobalCupertinoLocalizations`

## Description

Implementation of localized strings for Cupertino widgets using the `intl`
 package for date and time formatting.

 Further localization of strings beyond date time formatting are provided
 by language specific subclasses of [GlobalCupertinoLocalizations].

 ## Supported languages

 This class supports locales with the following [Locale.languageCode]s:

 

 This list is available programmatically via [kCupertinoSupportedLanguages].

 ## Sample code

 To include the localizations provided by this class in a [CupertinoApp],
 add [GlobalCupertinoLocalizations.delegates] to
 [CupertinoApp.localizationsDelegates], and specify the locales your
 app supports with [CupertinoApp.supportedLocales]:

 ```dart
 const CupertinoApp(
   localizationsDelegates: GlobalCupertinoLocalizations.delegates,
   supportedLocales: <Locale>[
     Locale('en', 'US'), // American English
     Locale('he', 'IL'), // Israeli Hebrew
     // ...
   ],
   // ...
 )
 ```

 See also:

  * [DefaultCupertinoLocalizations], which provides US English localizations
    for Cupertino widgets.

## Dependencies

- CupertinoLocalizations

## Members

- **_localeName**: `String`
- **_fullYearFormat**: `intl.DateFormat`
- **_dayFormat**: `intl.DateFormat`
- **_weekdayFormat**: `intl.DateFormat`
- **_mediumDateFormat**: `intl.DateFormat`
- **_singleDigitHourFormat**: `intl.DateFormat`
- **_singleDigitMinuteFormat**: `intl.DateFormat`
- **_doubleDigitMinuteFormat**: `intl.DateFormat`
- **_singleDigitSecondFormat**: `intl.DateFormat`
- **_decimalFormat**: `intl.NumberFormat`
- **delegate**: `LocalizationsDelegate&lt;CupertinoLocalizations&gt;`
  A [LocalizationsDelegate] for [CupertinoLocalizations].

 Most internationalized apps will use [GlobalCupertinoLocalizations.delegates]
 as the value of [CupertinoApp.localizationsDelegates] to include
 the localizations for both the cupertino and widget libraries.

- **delegates**: `List&lt;LocalizationsDelegate&lt;dynamic&gt;&gt;`
  A value for [CupertinoApp.localizationsDelegates] that's typically used by
 internationalized apps.

 ## Sample code

 To include the localizations provided by this class and by
 [GlobalWidgetsLocalizations] in a [CupertinoApp],
 use [GlobalCupertinoLocalizations.delegates] as the value of
 [CupertinoApp.localizationsDelegates], and specify the locales your
 app supports with [CupertinoApp.supportedLocales]:

 ```dart
 const CupertinoApp(
   localizationsDelegates: GlobalCupertinoLocalizations.delegates,
   supportedLocales: <Locale>[
     Locale('en', 'US'), // English
     Locale('he', 'IL'), // Hebrew
   ],
   // ...
 )
 ```

## Constructors

### Unnamed Constructor
Initializes an object that defines the Cupertino widgets' localized
 strings for the given `localeName`.

 The remaining '*Format' arguments uses the intl package to provide
 [DateFormat] configurations for the `localeName`.


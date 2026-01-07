# Overview for `DefaultMaterialLocalizations`

## Description

US English strings for the material widgets.

 See also:

  * [GlobalMaterialLocalizations], which provides material localizations for
    many languages.
  * [MaterialApp.localizationsDelegates], which automatically includes
    [DefaultMaterialLocalizations.delegate] by default.

## Dependencies

- MaterialLocalizations

## Members

- **_shortWeekdays**: `List&lt;String&gt;`
- **_weekdays**: `List&lt;String&gt;`
- **_narrowWeekdays**: `List&lt;String&gt;`
- **_shortMonths**: `List&lt;String&gt;`
- **_months**: `List&lt;String&gt;`
- **delegate**: `LocalizationsDelegate&lt;MaterialLocalizations&gt;`
  A [LocalizationsDelegate] that uses [DefaultMaterialLocalizations.load]
 to create an instance of this class.

 [MaterialApp] automatically adds this value to [MaterialApp.localizationsDelegates].

## Constructors

### Unnamed Constructor
Constructs an object that defines the material widgets' localized strings
 for US English (only).

 [LocalizationsDelegate] implementations typically call the static [load]
 function, rather than constructing this class directly.


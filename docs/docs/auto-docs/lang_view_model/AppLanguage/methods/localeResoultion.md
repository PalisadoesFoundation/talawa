# Method: `localeResoultion`

## Description

This function fetches the appropriate locale for the user's app based on the provided locale and supported locales.

 **params**:
 * `locale`: (`Locale?`): The locale to be resolved. Can be null.
 * `supportedLocales`: (`Iterable<Locale>`): The list of supported locales in the app.

 **returns**:
 * `Locale`: The resolved locale that matches either the language code or the country code of the provided locale.
              If no match is found or the provided locale is null, the first supported locale is returned.

## Return Type
`Locale`

## Parameters

- `locale`: `Locale?`
- `supportedLocales`: `Iterable<Locale>`

# Method: `computePlatformResolvedLocale`

## Description

Performs the platform-native locale resolution.

 Each platform may return different results.

 If the platform fails to resolve a locale, then this will return null.

 This method returns synchronously and is a direct call to
 platform specific APIs without invoking method channels.

## Return Type
`Locale?`

## Parameters

- `supportedLocales`: `List&lt;Locale&gt;`

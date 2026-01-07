# Overview for `SupportedBrowser`

## Description

/**
 * An annotation used to mark a feature as only being supported by a subset
 * of the browsers that Dart supports by default.
 *
 * If an API is not annotated with [SupportedBrowser] then it is assumed to
 * work on all browsers Dart supports.
 */

## Members

- **CHROME**: `String`
- **FIREFOX**: `String`
- **IE**: `String`
- **OPERA**: `String`
- **SAFARI**: `String`
- **browserName**: `String`
  The name of the browser.

- **minimumVersion**: `String?`
  The minimum version of the browser that supports the feature, or null
 if supported on all versions.

## Constructors

### Unnamed Constructor



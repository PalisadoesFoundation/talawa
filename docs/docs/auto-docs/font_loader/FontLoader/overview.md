# Overview for `FontLoader`

## Description

A class that enables the dynamic loading of fonts at runtime.

 The [FontLoader] class provides a builder pattern, where the caller builds
 up the assets that make up a font family, then calls [load] to load the
 entire font family into a running Flutter application.

## Members

- **family**: `String`
  The font family being loaded.

 The family groups a series of related font assets, each of which defines
 how to render a specific [FontWeight] and [FontStyle] within the family.

- **_loaded**: `bool`
- **_fontFutures**: `List&lt;Future&lt;Uint8List&gt;&gt;`
## Constructors

### Unnamed Constructor
Creates a new [FontLoader] that will load font assets for the specified
 [family].

 The font family will not be available for use until [load] has been
 called.


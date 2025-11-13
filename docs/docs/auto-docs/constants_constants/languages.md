<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [constants/constants.dart](../constants_constants/constants_constants-library.md)
3.  languages property

<div class="self-name">

languages

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="constants_constants/constants_constants-library-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-top-level-property">languages</span> top-level property

</div>

<div class="section multi-line-signature">

[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Language](../models_language_language_model/Language-class.md)</span>\></span>
<span class="name">languages</span>

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div class="section desc markdown">

This file contains the prototypes of all the supported languages and
currencies used in the application.

A list of `Language` objects representing the languages supported by the
application.

Each `Language` object contains the following properties:

- `countryCode`: The country code associated with the language.
- `langCode`: The language code representing the language.
- `langName`: The name of the language in its native script.
- `langSample`: A sample text phrase in the language, used for display
  purposes.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
List<Language> languages = [
  Language(
    countryCode: 'US',
    langCode: 'en',
    langName: 'English',
    langSample: 'Welcome User',
  ),
  Language(
    countryCode: 'IN',
    langCode: 'hi',
    langName: 'हिंदी',
    langSample: 'स्वागत उपयोगकर्ता',
  ),
  Language(
    countryCode: 'CN',
    langCode: 'zh',
    langName: '中国人',
    langSample: '欢迎用户',
  ),
  Language(
    countryCode: 'FR',
    langCode: 'fr',
    langName: 'français',
    langSample: 'Bienvenue utilisateur',
  ),
  Language(
    countryCode: 'ES',
    langCode: 'es',
    langName: 'Española',
    langSample: 'Bienvenida usuario',
  ),
  Language(
    countryCode: 'JP',
    langCode: 'ja',
    langName: '日本',
    langSample: 'ようこそユーザー',
  ),
  Language(
    countryCode: 'GE',
    langCode: 'de',
    langName: 'Deutsch',
    langSample: 'Willkommen Benutzer',
  ),
  Language(
    countryCode: 'PE',
    langCode: 'pt',
    langName: 'português',
    langSample: 'Bem-vindo, usuário',
  ),
];
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [constants](../constants_constants/constants_constants-library.md)
3.  languages property

##### constants library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

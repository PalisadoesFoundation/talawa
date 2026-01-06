
<div>

# languages top-level property

</div>


[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Language](../models_language_language_model/Language-class.md)]\>]
languages


getter/setter pair




This file contains the prototypes of all the supported languages and
currencies used in the application.

A list of
[Language](../models_language_language_model/Language-class.md)
objects representing the languages supported by the application.

Each [Language](../models_language_language_model/Language-class.md)
object contains the following properties:

-   `countryCode`: The country code associated with the language.
-   `langCode`: The language code representing the language.
-   `langName`: The name of the language in its native script.
-   `langSample`: A sample text phrase in the language, used for display
    purposes.



## Implementation

``` language-dart
List&lt;Language&gt; languages = [
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







1.  [talawa](../index.md)
2.  [constants](../constants_constants/)
3.  languages property

##### constants library








<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [view_model/lang_view_model.dart](../../view_model_lang_view_model/view_model_lang_view_model-library.md)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  userLanguageQuery method

<div class="self-name">

userLanguageQuery

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">userLanguageQuery</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">userLanguageQuery</span>(

1.  <span id="userLanguageQuery-param-userId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">userId</span></span>

)

</div>

<div class="section desc markdown">

This function perform graphQL query to check the user's language in the
database.

The function uses `gqlAuthQuery` method provided by Database Functions
Services.

**params**:

- `userId`: user for which language need to be fetch.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void> userLanguageQuery(String userId) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [lang_view_model](../../view_model_lang_view_model/view_model_lang_view_model-library.md)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  userLanguageQuery method

##### AppLanguage class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

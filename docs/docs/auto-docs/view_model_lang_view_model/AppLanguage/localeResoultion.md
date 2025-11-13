<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [view_model/lang_view_model.dart](../../view_model_lang_view_model/view_model_lang_view_model-library.md)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  localeResoultion method

<div class="self-name">

localeResoultion

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

# <span class="kind-method">localeResoultion</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)</span>
<span class="name">localeResoultion</span>(

1.  <span id="localeResoultion-param-locale"
    class="parameter"><span class="type-annotation">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)?</span>
    <span class="parameter-name">locale</span>, </span>
2.  <span id="localeResoultion-param-supportedLocales"
    class="parameter"><span class="type-annotation">[Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.html)<span class="signature">\<<span class="type-parameter">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)</span>\></span></span>
    <span class="parameter-name">supportedLocales</span></span>

)

</div>

<div class="section desc markdown">

This function fetches the appropriate locale for the user's app based on
the provided locale and supported locales.

**params**:

- `locale`: (`Locale?`): The locale to be resolved. Can be null.
- `supportedLocales`: (`Iterable<Locale>`): The list of supported
  locales in the app.

**returns**:

- `Locale`: The resolved locale that matches either the language code or
  the country code of the provided locale. If no match is found or the
  provided locale is null, the first supported locale is returned.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Locale localeResoultion(Locale? locale, Iterable<Locale> supportedLocales) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [lang_view_model](../../view_model_lang_view_model/view_model_lang_view_model-library.md)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  localeResoultion method

##### AppLanguage class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

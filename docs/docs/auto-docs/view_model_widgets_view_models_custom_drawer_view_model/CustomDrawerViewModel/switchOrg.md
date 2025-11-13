<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.md)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  switchOrg method

<div class="self-name">

switchOrg

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">switchOrg</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">void</span>
<span class="name">switchOrg</span>(

1.  <span id="switchOrg-param-switchToOrg"
    class="parameter"><span class="type-annotation">[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)</span>
    <span class="parameter-name">switchToOrg</span></span>

)

</div>

<div class="section desc markdown">

This function switches the organization to the specified `switchToOrg`.

If `selectedOrg` is equal to `switchToOrg` and `switchToOrg` is present,
a warning message is displayed using a custom Snackbar. Otherwise, it
saves the `switchToOrg` as the current organization, updates the
selected organization name, and displays an informational message using
a custom Snackbar.

**params**:

- `switchToOrg`: The organization to switch to.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
void switchOrg(OrgInfo switchToOrg) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.md)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  switchOrg method

##### CustomDrawerViewModel class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

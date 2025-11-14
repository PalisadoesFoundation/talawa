<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/utils_queries-library.md)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  createDonation method

<div class="self-name">

createDonation

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_queries/Queries-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">createDonation</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">createDonation</span>(

1.  <span id="createDonation-param-userId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">userId</span>, </span>
2.  <span id="createDonation-param-orgId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">orgId</span>, </span>
3.  <span id="createDonation-param-nameOfOrg"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">nameOfOrg</span>, </span>
4.  <span id="createDonation-param-nameOfUser"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">nameOfUser</span>, </span>
5.  <span id="createDonation-param-payPalId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">payPalId</span>, </span>
6.  <span id="createDonation-param-amount"
    class="parameter"><span class="type-annotation">[double](https://api.flutter.dev/flutter/dart-core/double-class.html)</span>
    <span class="parameter-name">amount</span></span>

)

</div>

<div class="section desc markdown">

`createDonation` creates a new donation transaction by taking the userId
,orgId ,nameOfOrg ,nameOfUser as parameters.

more_info_if_required

**params**:

- `userId`: user identifier
- `orgId`: org identifier
- `nameOfOrg`: org data
- `nameOfUser`: user data
- `payPalId`: for payment
- `amount`: amount

**returns**:

- `String`: mutation in string form, to be passed on to graphql client.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String createDonation(
  String userId,
  String orgId,
  String nameOfOrg,
  String nameOfUser,
  String payPalId,
  double amount,
) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/utils_queries-library.md)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  createDonation method

##### Queries class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

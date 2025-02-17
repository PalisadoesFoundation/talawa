::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [invite]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [invite]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#invite-param-context .parameter}

)
:::

::: {.section .desc .markdown}
This Function creates a QR Code for latest release .

**params**:

-   `context`: Build Context

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void invite(BuildContext context) {
  _appLanguageService.initialize();
  final String qrData =
      '${GraphqlConfig.orgURI}?orgid=${userConfig.currentOrg.id!}';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.80,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconButton(
                CustomPaint(
                  size: const Size(48, 48 * 1),
                  painter: AppLogo(),
                ),
                () {},
              ),
              const SizedBox(height: 20),
              Text(
                '${userConfig.currentOrg.name}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.strictTranslate('JOIN'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    },
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  invite method

##### ProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::

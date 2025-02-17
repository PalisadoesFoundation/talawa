::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/JoinOrganisationAfterAuth-class-sidebar.html" below-sidebar=""}
<div>

# [scanQR]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [scanQR]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}, ]{#scanQR-param-context .parameter}
2.  [[[SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}]{#scanQR-param-model .parameter}

)
:::

::: {.section .desc .markdown}
scanQR returns a widget that is use in joining the organization via the
QR code.

**params**:

-   `context`: Build context to perform context related operation
-   `model`: Viewmodel

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void scanQR(BuildContext context, SelectOrganizationViewModel model) {
  showModalBottomSheet(
    context: context,
    barrierColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: QRView(
                  key: model.qrKey,
                  onQRViewCreated: (controller) =>
                      _onQRViewCreated(controller, model),
                  overlay: QrScannerOverlayShape(
                    overlayColor: Theme.of(context).colorScheme.secondary,
                    borderRadius: 10,
                    borderLength: 20,
                    borderWidth: 10,
                    cutOutSize: 250,
                  ),
                  /*overlayMargin: EdgeInsets.all(50)*/
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 4,
              ),
              Text(
                AppLocalizations.of(context)!.strictTranslate('Scan QR'),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 4,
              ),
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
2.  [join_organisation_after_auth](../../views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/)
3.  [JoinOrganisationAfterAuth](../../views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/JoinOrganisationAfterAuth-class.html)
4.  scanQR method

##### JoinOrganisationAfterAuth class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::

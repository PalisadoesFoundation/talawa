




scanQR method - JoinOrganisationAfterAuth class - join\_organisation\_after\_auth library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/join\_org\_after\_auth/join\_organisation\_after\_auth.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/)
3. [JoinOrganisationAfterAuth](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/JoinOrganisationAfterAuth-class.html)
4. scanQR method

scanQR


dark\_mode

light\_mode




# scanQR method


void
scanQR(

1. dynamic context,
2. dynamic model

)

scanQR returns a widget that is use in joining the organization via the QR code.

**params**:

* `context`: Build context to perform context related operation
* `model`: Viewmodel

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [join\_organisation\_after\_auth](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/)
3. [JoinOrganisationAfterAuth](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/JoinOrganisationAfterAuth-class.html)
4. scanQR method

##### JoinOrganisationAfterAuth class





talawa
1.0.0+1







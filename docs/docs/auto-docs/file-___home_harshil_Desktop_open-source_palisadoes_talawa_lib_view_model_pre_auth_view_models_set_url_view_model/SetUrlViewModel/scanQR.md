




scanQR method - SetUrlViewModel class - set\_url\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/set\_url\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/)
3. [SetUrlViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4. scanQR method

scanQR


dark\_mode

light\_mode




# scanQR method


void
scanQR(

1. dynamic context

)

This function create a widget which is used to scan the QR-code.

**params**:

* `context`: BuildContext

**returns**:
None


## Implementation

```
void scanQR(BuildContext context) {
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
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
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
              const Text('Scan QR'),
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
2. [set\_url\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/)
3. [SetUrlViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4. scanQR method

##### SetUrlViewModel class





talawa
1.0.0+1







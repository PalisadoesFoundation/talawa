


# scanQR method








void scanQR
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.md) model)





<p>scanQR returns a widget that is use in joining the organization via the QR code.</p>



## Implementation

```dart
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
              const Text('Scan QR'),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 4,
              )
            ],
          ),
        ),
      );
    },
  );
}
```








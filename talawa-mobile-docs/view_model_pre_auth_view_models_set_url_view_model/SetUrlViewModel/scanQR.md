


# scanQR method








void scanQR
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)





<p>This function create a widget which is used to scan the QR-code.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>context</code>: BuildContext</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
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
              )
            ],
          ),
        ),
      );
    },
  );
}
```








import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
import 'package:vibration/vibration.dart';

class SetUrlViewModel extends BaseModel {
  final formKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  String orgId = '-1';
  static const imageUrlKey = "imageUrl";
  static const urlKey = "url";
  TextEditingController url = TextEditingController();
  FocusNode urlFocus = FocusNode();
  late List<Map<String, dynamic>> greeting;
  AutovalidateMode validate = AutovalidateMode.disabled;

  initialise({String inviteUrl = ''}) {
    final uri = inviteUrl;
    if (uri.isNotEmpty) {
      /// assigning the invite server url to the url text controller
      url.text = uri;
      final box = Hive.box('url');
      box.put(urlKey, uri);
      box.put(imageUrlKey, "$uri/talawa/");
      graphqlConfig.getOrgUrl();
    }
    greeting = [
      {
        'text': 'Join ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'and ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'Collaborate ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'with your ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'Organizations',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5!
            .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
      },
    ];
    notifyListeners();
  }

  checkURLandNavigate(String navigateTo, String argument) async {
    urlFocus.unfocus();
    validate = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      navigationService
          .pushDialog(const CustomProgressDialog(key: Key('UrlCheckProgress')));
      validate = AutovalidateMode.disabled;
      final String uri = url.text.trim();
      final bool? urlPresent =
          await locator<Validator>().validateUrlExistence(uri);
      if (urlPresent! == true) {
        final box = Hive.box('url');
        box.put(urlKey, uri);
        box.put(imageUrlKey, "$uri/talawa/");

        navigationService.pop();
        graphqlConfig.getOrgUrl();
        navigationService.pushScreen(navigateTo, arguments: argument);
      } else {
        navigationService
            .showSnackBar("URL doesn't exist/no connection please check");
      }
    }
  }

  scanQR(BuildContext context) {
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

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code.isNotEmpty) {
        print(scanData.code);
        try {
          final List<String> data = scanData.code.split('?');
          url.text = data[0];
          final List<String> queries = data[1].split('&');
          orgId = queries[0].split('=')[1];
          Vibration.vibrate(duration: 100);
          controller.stopCamera();
          controller.dispose();
          final box = Hive.box('url');
          box.put(urlKey, url.text);
          box.put(imageUrlKey, "${url.text}/talawa/");
          graphqlConfig.getOrgUrl();
          Navigator.pop(navigationService.navigatorKey.currentContext!);
          navigationService.pushScreen('/selectOrg', arguments: orgId);
        } on Exception catch (e) {
          print(e);
          print('invalid app qr');
        }
      }
    });
  }
}

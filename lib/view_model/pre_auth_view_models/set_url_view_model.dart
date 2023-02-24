import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
import 'package:vibration/vibration.dart';

/// SetUrlViewModel class helps to interact with model to serve data
/// and react to user's input for Set Url Section.
///
/// Methods include:
/// * `checkURLandNavigate`
/// * `scanQR`
class SetUrlViewModel extends BaseModel {
  // variables
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

  // initialiser
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
    // greeting message
    greeting = [
      {
        'text': 'Join ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'and ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall
      },
      {
        'text': 'Collaborate ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'with your ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall
      },
      {
        'text': 'Organizations',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
      },
    ];
    notifyListeners();
  }

  /// This function check the URL and navigate to the respective URL.
  ///
  /// params:
  /// * [navigateTo] : url.
  /// * [argument] : more information.
  checkURLandNavigate(String navigateTo, String argument) async {
    urlFocus.unfocus();
    validate = AutovalidateMode.always;
    // if the url is valid.
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
        // navigationService
        //     .showSnackBar("URL doesn't exist/no connection please check");

        navigationService.showTalawaErrorSnackBar(
          "URL doesn't exist/no connection please check",
          MessageType.error,
        );
      }
    }
  }

  /// This function returns a widget which is used to scan the QR-code.
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

  // This is the helper function which execute when the on QR view created.
  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      // if the scanData is not empty.
      if (scanData.code!.isNotEmpty) {
        print(scanData.code);
        try {
          final List<String> data = scanData.code!.split('?');
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
        } on CameraException catch (e) {
          debugPrint(e.toString());
          navigationService.showTalawaErrorSnackBar(
            "The Camera is not working",
            MessageType.error,
          );
        } on QrEmbeddedImageException catch (e) {
          debugPrint(e.toString());
          navigationService.showTalawaErrorDialog(
            "The QR is not Working",
            MessageType.error,
          );
        } on QrUnsupportedVersionException catch (e) {
          debugPrint(e.toString());
          navigationService.showTalawaErrorDialog(
            "This QR version is not Supported.",
            MessageType.error,
          );
        } on Exception catch (e) {
          debugPrint(e.toString());
          navigationService.showTalawaErrorSnackBar(
            "This QR is not for the App",
            MessageType.error,
          );
        }
      }
    });
  }
}

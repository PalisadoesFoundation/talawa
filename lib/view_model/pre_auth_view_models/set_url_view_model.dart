import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
import 'package:vibration/vibration.dart';

/// SetUrlViewModel class helps to interact with model to serve data.
///
/// and react to user's input for Set Url Section.
/// Methods include:
/// * `checkURLandNavigate`
/// * `scanQR`
/// * `initialise`
/// * `checkURLandShowPopUp`
/// * `_onQRViewCreated`

class SetUrlViewModel extends BaseModel {
  // variables

  /// formKey.
  final formKey = GlobalKey<FormState>();

  /// qrKey.
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  /// organizationID.
  String orgId = '-1';

  /// imageUrlKey.
  static const imageUrlKey = "imageUrl";

  /// urlKey.
  static const urlKey = "url";

  /// url.
  TextEditingController url = TextEditingController();

  /// urlFocus.
  FocusNode urlFocus = FocusNode();

  /// qrController.
  late List<Map<String, dynamic>> greeting;

  /// qrValidator.
  AutovalidateMode validate = AutovalidateMode.disabled;

  /// QR stream subscription.
  StreamSubscription<Barcode>? _qrSubscription;

  /// This function initialises the variables.
  ///
  /// **params**:
  /// * `context`: BuildContext for theme access
  /// * `inviteUrl`: url
  ///
  /// **returns**:
  ///   None

  void initialise(BuildContext context, {String inviteUrl = ''}) {
    final uri = inviteUrl;
    if (uri.isNotEmpty) {
      /// assigning the invite server url to the url text controller.
      url.text = uri;
      final box = Hive.box('url');
      box.put(urlKey, uri);
      box.put(imageUrlKey, "$uri/talawa/");
      graphqlConfig.getOrgUrl();
    }

    /// greeting message.
    greeting = [
      {
        'text': 'Join ',
        'textStyle': Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
      },
      {
        'text': 'and ',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': 'Collaborate ',
        'textStyle': Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
      },
      {
        'text': 'with your ',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': 'Organizations',
        'textStyle': Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 24, color: const Color(0xFF4285F4)),
      },
    ];
    notifyListeners();
  }

  /// This function check the URL and navigate to the respective URL.
  ///
  /// **params**:
  /// * `navigateTo`: url
  /// * `argument`: message
  ///
  /// **returns**:
  ///   None

  Future<void> checkURLandNavigate(String navigateTo, String argument) async {
    urlFocus.unfocus();
    validate = AutovalidateMode.always;

    /// if the url is valid.
    if (formKey.currentState!.validate()) {
      await actionHandlerService.performAction(
        actionType: ActionType.critical,
        criticalActionFailureMessage: navigateTo == '/login'
            ? TalawaErrors.youAreOfflineUnableToLogin
            : TalawaErrors.youAreOfflineUnableToSignUp,
        action: () async {
          navigationService.pushDialog(
            const CustomProgressDialog(
              key: Key('UrlCheckProgress'),
            ),
          );
          validate = AutovalidateMode.disabled;
          final String uri = url.text.trim();
          final bool? urlPresent =
              await locator<Validator>().validateUrlExistence(uri);
          if (urlPresent == true) {
            final box = Hive.box('url');
            box.put(urlKey, uri);
            box.put(imageUrlKey, "$uri/talawa/");
            navigationService.pop();
            graphqlConfig.getOrgUrl();
            navigationService.pushScreen(navigateTo, arguments: argument);
          } else {
            navigationService.pop();
            navigationService.showTalawaErrorSnackBar(
              urlPresent == false
                  ? "URL doesn't exist/no connection please check"
                  : "Unable to validate URL",
              MessageType.error,
            );
          }
          return null;
        },
      );
    }
  }

  /// This function check the URL and navigate to the respective URL.
  ///
  /// **params**:
  /// * `argument`: message
  ///
  /// **returns**:
  ///   None

  Future<void> checkURLandShowPopUp(String argument) async {
    urlFocus.unfocus();
    validate = AutovalidateMode.always;

    // if the url is valid.
    if (formKey.currentState!.validate()) {
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('UrlCheckProgress'),
        ),
      );
      validate = AutovalidateMode.disabled;
      final String uri = url.text.trim();
      final bool? urlPresent =
          await locator<Validator>().validateUrlExistence(uri);
      if (urlPresent == true) {
        final box = Hive.box('url');
        box.put(urlKey, uri);
        box.put(imageUrlKey, "$uri/talawa/");
        navigationService.pop();
        graphqlConfig.getOrgUrl();
        navigationService.showSnackBar("Url is valid");
      } else {
        navigationService.pop();
        navigationService.showTalawaErrorDialog(
          urlPresent == false
              ? "URL doesn't exist/no connection please check"
              : "Unable to validate URL",
          MessageType.info,
        );
      }
    }
  }

  /// This function create a widget which is used to scan the QR-code.
  ///
  /// **params**:
  /// * `context`: BuildContext
  ///
  /// **returns**:
  ///   None

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

  /// This is the helper function which execute when the on QR view created.
  ///
  /// **params**:
  /// * `controller`: QRViewController
  ///
  /// **returns**:
  ///   None

  void _onQRViewCreated(QRViewController controller) {
    _qrSubscription = controller.scannedDataStream.listen((scanData) {
      /// if the scanData is not empty.
      if (scanData.code!.isNotEmpty) {
        try {
          final List<String> data = scanData.code!.split('?');
          if (data.length < 2) {
            throw const FormatException(
                'Invalid QR format: missing query string');
          }
          url.text = data[0];
          final List<String> queries = data[1].split('&');
          if (queries.isEmpty || !queries[0].contains('=')) {
            throw const FormatException('Invalid QR format: missing orgId');
          }
          orgId = queries[0].split('=')[1];
          Vibration.vibrate(duration: 100);
          controller.stopCamera();
          _qrSubscription?.cancel();
          _qrSubscription = null;
          final box = Hive.box('url');
          box.put(urlKey, url.text);
          box.put(imageUrlKey, "${url.text}/talawa/");
          graphqlConfig.getOrgUrl();
          Navigator.pop(navigationService.navigatorKey.currentContext!);
          navigationService.pushScreen('/selectOrg', arguments: orgId);
        } on CameraException catch (e) {
          debugPrint(e.toString());
          controller.stopCamera();
          _qrSubscription?.cancel();
          _qrSubscription = null;
          navigationService.showTalawaErrorSnackBar(
            "The Camera is not working",
            MessageType.error,
          );
        } on QrEmbeddedImageException catch (e) {
          debugPrint(e.toString());
          controller.stopCamera();
          _qrSubscription?.cancel();
          _qrSubscription = null;
          navigationService.showTalawaErrorDialog(
            "The QR is not Working",
            MessageType.error,
          );
        } on QrUnsupportedVersionException catch (e) {
          debugPrint(e.toString());
          controller.stopCamera();
          _qrSubscription?.cancel();
          _qrSubscription = null;
          navigationService.showTalawaErrorDialog(
            "This QR version is not Supported.",
            MessageType.error,
          );
        } on Exception catch (e) {
          debugPrint(e.toString());
          controller.stopCamera();
          _qrSubscription?.cancel();
          _qrSubscription = null;
          navigationService.showTalawaErrorSnackBar(
            "This QR is not for the App",
            MessageType.error,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _qrSubscription?.cancel();
    url.dispose();
    urlFocus.dispose();
    super.dispose();
  }
}

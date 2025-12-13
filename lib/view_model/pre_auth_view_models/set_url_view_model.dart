import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
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

  /// greeting message styling configuration.
  late List<Map<String, dynamic>> greeting;

  /// qrValidator.
  AutovalidateMode validate = AutovalidateMode.disabled;

  /// QR stream subscription.
  StreamSubscription<Barcode>? _qrSubscription;

  /// QR controller.
  QRViewController? _qrController;

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
      // Assign to the field, but avoid persisting until validated/confirmed.
      // (Optionally: run Validator/Uri.tryParse checks before persisting.)
      url.text = uri;
    }

    /// greeting message.
    final loc = AppLocalizations.of(context);
    greeting = [
      {
        'text': loc?.strictTranslate('Join') ?? 'Join',
        'textStyle': Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
      },
      {
        'text': ' ',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': loc?.strictTranslate('and') ?? 'and',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': ' ',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': loc?.strictTranslate('Collaborate') ?? 'Collaborate',
        'textStyle': Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
      },
      {
        'text': ' ',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': loc?.strictTranslate('with your') ?? 'with your',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': ' ',
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': loc?.strictTranslate('Organizations') ?? 'Organizations',
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
  /// * `navigateTo`: navigation route
  /// * `argument`: message
  ///
  /// **returns**:
  ///   None

  Future<void> checkURLandNavigate(String navigateTo, String argument) async {
    urlFocus.unfocus();
    validate = AutovalidateMode.always;

    /// if the url is valid.
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
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
          bool shouldNavigate = false;
          try {
            validate = AutovalidateMode.disabled;
            final String uri = url.text.trim().replaceFirst(RegExp(r'/*$'), '');

            // Get context and localized strings before async operations
            final context = navigationService.navigatorKey.currentContext;
            final localizations =
                context != null ? AppLocalizations.of(context) : null;
            final urlNotExistMessage = localizations?.strictTranslate(
                    "URL doesn't exist/no connection please check") ??
                "URL doesn't exist/no connection please check";
            final unableToValidateMessage =
                localizations?.strictTranslate("Something went wrong!") ??
                    "Something went wrong!";

            final bool? urlPresent =
                await locator<Validator>().validateUrlExistence(uri);
            if (urlPresent == true) {
              final box = Hive.box('url');
              box.put(urlKey, uri);
              box.put(imageUrlKey, "$uri/talawa/");
              graphqlConfig.getOrgUrl();
              shouldNavigate = true;
            } else {
              navigationService.showTalawaErrorSnackBar(
                urlPresent == false
                    ? urlNotExistMessage
                    : unableToValidateMessage,
                MessageType.error,
              );
            }
          } finally {
            navigationService.pop();
          }
          if (shouldNavigate) {
            navigationService.pushScreen(navigateTo, arguments: argument);
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

    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      await actionHandlerService.performAction(
        actionType: ActionType.critical,
        criticalActionFailureMessage: TalawaErrors.userActionNotSaved,
        action: () async {
          navigationService.pushDialog(
            const CustomProgressDialog(
              key: Key('UrlCheckProgress'),
            ),
          );

          try {
            validate = AutovalidateMode.disabled;
            final String uri = url.text.trim().replaceFirst(RegExp(r'/*$'), '');

            // Get context and localized strings before async operations
            final context = navigationService.navigatorKey.currentContext;
            final localizations =
                context != null ? AppLocalizations.of(context) : null;
            final urlNotExistMessage = localizations?.strictTranslate(
                    "URL doesn't exist/no connection please check") ??
                "URL doesn't exist/no connection please check";
            final unableToValidateMessage =
                localizations?.strictTranslate("Something went wrong!") ??
                    "Something went wrong!";
            final urlValidMessage =
                localizations?.strictTranslate("URL is valid") ??
                    "URL is valid";

            final bool? urlPresent =
                await locator<Validator>().validateUrlExistence(uri);
            if (urlPresent == true) {
              final box = Hive.box('url');
              box.put(urlKey, uri);
              box.put(imageUrlKey, "$uri/talawa/");
              graphqlConfig.getOrgUrl();
              navigationService.showSnackBar(urlValidMessage);
            } else {
              navigationService.showTalawaErrorDialog(
                urlPresent == false
                    ? urlNotExistMessage
                    : unableToValidateMessage,
                MessageType.info,
              );
            }
          } finally {
            navigationService.pop();
          }
          return null;
        },
      );
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
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 4,
                ),
                Text(AppLocalizations.of(context)?.strictTranslate('Scan QR') ??
                    'Scan QR'),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 4,
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() async {
      await _qrSubscription?.cancel();
      _qrSubscription = null;
      if (_qrController != null) {
        if (defaultTargetPlatform == TargetPlatform.iOS) {
          await _qrController!.pauseCamera();
        } else {
          await _qrController!.stopCamera();
        }
        _qrController = null;
      }
    });
  }

  /// This is the helper function which execute when the on QR view created.
  ///
  /// **params**:
  /// * `controller`: QRViewController
  ///
  /// **returns**:
  ///   None

  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;

    // Get context and localized strings before async operations
    final context = navigationService.navigatorKey.currentContext;
    final localizations = context != null ? AppLocalizations.of(context) : null;
    final cameraNotWorkingMessage =
        localizations?.strictTranslate("The Camera is not working") ??
            "The Camera is not working";
    final qrNotForAppMessage =
        localizations?.strictTranslate("This QR is not for the App") ??
            "This QR is not for the App";

    _qrSubscription = controller.scannedDataStream.listen((scanData) async {
      /// if the scanData is not empty.
      final code = scanData.code;
      if (code != null && code.isNotEmpty) {
        try {
          final parsed = Uri.tryParse(code);
          if (parsed == null || parsed.scheme.isEmpty || parsed.host.isEmpty) {
            throw const FormatException('Invalid QR format: invalid URL');
          }
          final parsedOrgId = parsed.queryParameters['orgId'];
          if (parsedOrgId == null || parsedOrgId.isEmpty) {
            throw const FormatException('Invalid QR format: missing orgId');
          }
          url.text = parsed.origin;
          orgId = parsedOrgId;
          Vibration.vibrate(duration: 100);
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            await controller.pauseCamera();
          } else {
            await controller.stopCamera();
          }
          await _qrSubscription?.cancel();
          _qrSubscription = null;
          final box = Hive.box('url');
          box.put(urlKey, url.text);
          box.put(imageUrlKey, "${url.text}/talawa/");
          graphqlConfig.getOrgUrl();
          navigationService.pop();
          navigationService.pushScreen('/selectOrg', arguments: orgId);
        } on CameraException catch (e) {
          debugPrint(e.toString());
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            await controller.pauseCamera();
          } else {
            await controller.stopCamera();
          }
          await _qrSubscription?.cancel();
          _qrSubscription = null;
          navigationService.showTalawaErrorSnackBar(
            cameraNotWorkingMessage,
            MessageType.error,
          );
        } on Exception catch (e) {
          debugPrint(e.toString());
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            await controller.pauseCamera();
          } else {
            await controller.stopCamera();
          }
          await _qrSubscription?.cancel();
          _qrSubscription = null;
          navigationService.showTalawaErrorSnackBar(
            qrNotForAppMessage,
            MessageType.error,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    // Cancel subscription without await in dispose since dispose is sync
    // The subscription will be cleaned up by whenComplete in scanQR
    _qrSubscription?.cancel();
    url.dispose();
    urlFocus.dispose();
    super.dispose();
  }
}

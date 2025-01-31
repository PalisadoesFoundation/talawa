// ignore_for_file: talawa_api_doc, talawa_good_doc_comments
import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/organization_list.dart';
import 'package:talawa/widgets/organization_search_list.dart';
import 'package:vibration/vibration.dart';

/// JoinOrganisationAfterAuth returns a widget for page to join the organization just after user authentication.
class JoinOrganisationAfterAuth extends StatefulWidget {
  const JoinOrganisationAfterAuth({super.key, required this.orgId});

  /// org identifier.
  ///
  final String orgId;

  @override
  State<JoinOrganisationAfterAuth> createState() =>
      _JoinOrganisationAfterAuthState();
}

class _JoinOrganisationAfterAuthState extends State<JoinOrganisationAfterAuth> {
  /// qrController.
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectOrganizationViewModel>(
      onModelReady: (model) => model.initialise(widget.orgId),
      builder: (context, model, child) {
        return Scaffold(
          key: const Key('JoinOrgScreen'),
          // header for the widget
          appBar: AppBar(
            centerTitle: true,
            // title of the header.
            title: Text(
              AppLocalizations.of(context)!
                  .strictTranslate('Join Organisation'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
            // action button for the option to join the organization using QR code.
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.qr_code_scanner,
                  size: 30,
                  semanticLabel: 'Join Organisation with QR',
                ),
                onPressed: () => scanQR(context, model),
              ),
            ],
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
              ),
              Expanded(
                // if model searching is under process then renders OrganizationSearchList widget
                // else renders OrganizationList widget.
                child: model.searching
                    ? OrganizationSearchList(model: model)
                    : OrganizationList(model: model),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
            ],
          ),
        );
      },
    );
  }

  /// scanQR returns a widget that is use in joining the organization via the QR code.
  ///
  /// **params**:
  /// * `context`: Build context to perform context related operation
  /// * `model`: Viewmodel
  ///
  /// **returns**:
  ///   None
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
                  child: MobileScanner(
                    fit: BoxFit.contain,
                    controller: controller,
                    errorBuilder: (ctx, error, _) {
                      final String errorMessage = error.toString();

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        navigationService.showTalawaErrorSnackBar(
                          errorMessage,
                          MessageType.error,
                        );
                      });

                      return Center(
                        child: Text(
                          errorMessage,
                        ),
                      );
                    },
                    onDetect: (scanData) => _onQRViewCreated(scanData, model),
                    overlayBuilder: (context, constraints) {
                      return Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 10,
                          ),
                        ),
                      );
                    },
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

  /// To handle to qr.
  ///
  /// **params**:
  /// * `controller`: Controller to manage qr activity
  /// * `model`: Viewmodel
  ///
  /// **returns**:
  ///   None
  void _onQRViewCreated(
    BarcodeCapture scanData,
    SelectOrganizationViewModel model,
  ) {
    if (scanData.raw != null && scanData.barcodes.isNotEmpty) {
      final String code = scanData.barcodes.first.displayValue!;
      print(code);
      try {
        final List<String> data = code.split('?');
        final String url = data[0];
        Vibration.vibrate(duration: 100);
        if (url == GraphqlConfig.orgURI) {
          final List<String> queries = data[1].split('&');
          model.orgId = queries[0].split('=')[1];
          controller.stop();
          controller.dispose();
          Navigator.pop(navigationService.navigatorKey.currentContext!);
          model.initialise(model.orgId);
        } else {
          navigationService.showTalawaErrorSnackBar(
            "Organisation on different server, logout and scan qr again",
            MessageType.error,
          );
        }
      } on Exception catch (e) {
        print(e);
        print('invalid app qr');
      }
    }
  }
}

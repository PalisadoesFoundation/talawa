import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
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
class JoinOrganisationAfterAuth extends StatelessWidget {
  const JoinOrganisationAfterAuth({Key? key, required this.orgId})
      : super(key: key);
  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectOrganizationViewModel>(
      onModelReady: (model) => model.initialise(orgId),
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

  void _onQRViewCreated(
    QRViewController controller,
    SelectOrganizationViewModel model,
  ) {
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code!.isNotEmpty) {
        print(scanData.code);
        try {
          final List<String> data = scanData.code!.split('?');
          final String url = data[0];
          Vibration.vibrate(duration: 100);
          if (url == GraphqlConfig.orgURI) {
            final List<String> queries = data[1].split('&');
            model.orgId = queries[0].split('=')[1];
            controller.stopCamera();
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
    });
  }
}

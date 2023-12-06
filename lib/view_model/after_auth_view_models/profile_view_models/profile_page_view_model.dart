// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:currency_picker/currency_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// ProfilePageViewModel class helps to interact with model to serve data
/// and react to user's input in Profile Page view.
///
/// Methods include:
/// * `logout`
class ProfilePageViewModel extends BaseModel {
  // Services
  final _userConfig = locator<UserConfig>();
  final _navigationService = locator<NavigationService>();
  final _appLanguageService = locator<AppLanguage>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode donationField = FocusNode();
  TextEditingController donationAmount = TextEditingController();
  late final Box<User> user;
  late final Box<dynamic> url;
  late final Box<OrgInfo> organisation;
  late OrgInfo currentOrg;
  late User currentUser;
  double bottomSheetHeight = SizeConfig.screenHeight! * 0.68;
  String donationCurrency = "USD";
  String donationCurrencySymbol = "\$";
  final List<String> denomination = ['1', '5', '10'];

  // initializer
  void initialize() {
    setState(ViewState.busy);
    currentOrg = _userConfig.currentOrg;
    currentUser = _userConfig.currentUser;
    setState(ViewState.idle);
  }

  /// This method destroys the user's session or sign out the user from app.
  /// The function asks for the confimation in Custom Alert Dialog.
  Future<void> logout(BuildContext context) async {
    // push custom alert dialog with the confirmation message.
    navigationService.pushDialog(
      CustomAlertDialog(
        reverse: true,
        dialogSubTitle: 'Are you sure you want to logout?',
        successText: 'Logout',
        success: () async {
          try {
            final result = await databaseFunctions
                .gqlAuthMutation(queries.logout()) as QueryResult?;
            if (result != null && result.data!['logout'] == true) {
              navigationService.pop();
              navigationService.pushDialog(
                const CustomProgressDialog(
                  key: Key('LogoutProgress'),
                ),
              );
              Future.delayed(const Duration(seconds: 1)).then((value) {
                user = Hive.box<User>('currentUser');
                url = Hive.box('url');
                final androidFirebaseOptionsBox =
                    Hive.box('androidFirebaseOptions');
                final iosFirebaseOptionsBox = Hive.box('iosFirebaseOptions');
                organisation = Hive.box<OrgInfo>('currentOrg');
                user.clear();
                url.clear();
                androidFirebaseOptionsBox.clear();
                iosFirebaseOptionsBox.clear();
                try {
                  Firebase.app()
                      .delete(); // Deleting app will stop all Firebase plugins
                } catch (e) {
                  debugPrint("ERROR: Unable to delete firebase app $e");
                }
                organisation.clear();
                navigationService.pop();
                navigationService.removeAllAndPush(
                  '/selectLang',
                  '/',
                  arguments: '0',
                );
              });
            }
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }

  /// This method changes the currency of the user for donation purpose.
  void changeCurrency(BuildContext context, Function setter) {
    showCurrencyPicker(
      context: context,
      currencyFilter: supportedCurrencies,
      onSelect: (Currency currency) {
        setter(() {
          donationCurrency = currency.code;
          donationCurrencySymbol = currency.symbol;
        });
      },
    );
  }

  /// This function generates the organization invitation link in a Dialog Box.
  /// Dialog box contains the QR-code of organization invite link and social media sharing options.
  void invite(BuildContext context) {
    _appLanguageService.initialize();
    final String url =
        'https://cyberwake.github.io/applink/invite?selectLang=${_appLanguageService.appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}';
    final String qrData =
        '${GraphqlConfig.orgURI}?orgid=${userConfig.currentOrg.id!}';
    print(url);
    print(qrData);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconButton(
                  CustomPaint(
                    size: const Size(48, 48 * 1),
                    painter: AppLogo(),
                  ),
                  () {},
                ),
                const SizedBox(height: 20),
                Text(
                  '${userConfig.currentOrg.name}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.strictTranslate('JOIN'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  /// This widget returns the button for social media sharing option.
  ///
  /// params:
  /// * [icon] : This is `Widget` type with icon details.
  /// * [onTap] : This is `Function`, which invoke on tap.
  Widget iconButton(Widget icon, Function onTap) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            print('tapped');
            onTap();
          },
          icon: icon,
        ),
      ],
    );
  }

  /// This widget returns button for domination.
  ///
  /// params:
  /// * [amount] : donation Amount.
  /// * [setter] : `Function` type, which on tap set the amount to `donationAmount`.
  Widget dominationButton(
    String amount,
    BuildContext context,
    Function setter,
  ) {
    return InkWell(
      onTap: () {
        setter(() {
          donationAmount.text = amount;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight! * 0.02,
          horizontal: SizeConfig.screenWidth! * 0.075,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: donationAmount.text == amount
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          '$donationCurrencySymbol $amount',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  // Listener on `donationField` widget focus.
  void attachListener(Function setter) {
    donationField.addListener(() {
      if (donationField.hasFocus) {
        setter(() {
          bottomSheetHeight = SizeConfig.screenHeight! * 0.8725;
        });
      } else {
        Future.delayed(const Duration(milliseconds: 300), () {
          {
            setter(() {
              bottomSheetHeight = SizeConfig.screenHeight! * 0.68;
            });
          }
        });
      }
    });
  }

  // pop the route from `navigationService`.
  void popBottomSheet() {
    _navigationService.pop();
  }

  // to update the bottom sheet height.
  void updateSheetHeight() {
    bottomSheetHeight = SizeConfig.screenHeight! * 0.65;
    notifyListeners();
  }

  // show message on Snack Bar.
  void showSnackBar(String message) {
    _navigationService.showTalawaErrorDialog(message, MessageType.error);
  }
}

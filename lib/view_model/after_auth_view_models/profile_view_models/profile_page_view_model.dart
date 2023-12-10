import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';

/// ProfilePageViewModel class helps to interact with model to serve data and react to user's input in Profile Page view.
///
/// Methods include:
/// * `logout`
class ProfilePageViewModel extends BaseModel {
  // Services
  final _userConfig = locator<UserConfig>();
  final _navigationService = locator<NavigationService>();
  final _appLanguageService = locator<AppLanguage>();

  /// GlobalKey for scaffoldKey.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// FocusNode for donationField.
  final FocusNode donationField = FocusNode();

  /// Text Controller for donation Amount.
  TextEditingController donationAmount = TextEditingController();

  /// Hive Box of user.
  late final Box<User> user;

  /// Hive Box of url.
  late final Box<dynamic> url;

  /// Hive Box of organisation.
  late final Box<OrgInfo> organisation;

  /// Holds Current Organization.
  late OrgInfo currentOrg;

  /// Holds Current user.
  late User currentUser;

  /// Size of Bottom Sheet Height.
  double bottomSheetHeight = SizeConfig.screenHeight! * 0.68;

  /// donationCurrency.
  String donationCurrency = "USD";

  /// Currency Symbol.
  String donationCurrencySymbol = "\$";

  /// denomination.
  final List<String> denomination = ['1', '5', '10'];

  /// First function to initialize the viewmodel.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    setState(ViewState.busy);
    currentOrg = _userConfig.currentOrg;
    currentUser = _userConfig.currentUser;
    setState(ViewState.idle);
  }

  /// This method destroys the user's session or sign out the user from app, The function asks for the confimation in Custom Alert Dialog.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget
  ///
  /// **returns**:
  /// * `Future<void>`: Resolves when user logout
  Future<void> logout(BuildContext context) async {
    // push custom alert dialog with the confirmation message.
    navigationService.pushDialog(logoutDialog());
  }

  /// This method changes the currency of the user for donation purpose.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget
  /// * `setter`: Setter Function
  ///
  /// **returns**:
  ///   None
  void changeCurrency(
    BuildContext context,
    void Function(void Function()) setter,
  ) {
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

  /// This Function creates a QR Code for latest release .
  ///
  /// **params**:
  /// * `context`: Build Context
  ///
  /// **returns**:
  ///   None
  void invite(BuildContext context) {
    _appLanguageService.initialize();
    // organization url
    // final String url =
    //     'https://cyberwake.github.io/applink/invite?selectLang=${_appLanguageService.appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}';
    // QR
    const String qrData =
        'https://github.com/PalisadoesFoundation/talawa/releases/download/automated/app-release.apk';
    print(url);
    print(qrData);
    showModalBottomSheet(
      context: context,
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
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.08,
                ),
                Text(
                  'Scan the QR to join ${userConfig.currentOrg.name}',
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     iconButton(
                //       const FaIcon(
                //         FontAwesomeIcons.twitter,
                //         size: 35,
                //         color: Color(0xFF1DA1F2),
                //       ),
                //       () async => SocialShare.shareTwitter('Join us', url: url),
                //     ),
                //     iconButton(
                //       CustomPaint(
                //         size: const Size(
                //           50,
                //           50 * 1.004,
                //         ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                //         painter: WhatsappLogo(),
                //       ),
                //       () async => SocialShare.shareWhatsapp(url),
                //     ),
                //     iconButton(
                //       CustomPaint(
                //         size: Size(
                //           45,
                //           (45 * 1).toDouble(),
                //         ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                //         painter: TelegramLogo(),
                //       ),
                //       () async => SocialShare.shareTelegram(url),
                //     ),
                //     iconButton(
                //       const FaIcon(
                //         FontAwesomeIcons.shareNodes,
                //         size: 30,
                //         color: Color(0xff40c351),
                //       ),
                //       () async => SocialShare.shareOptions(url),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget logoutDialog() {
    return CustomAlertDialog(
      reverse: true,
      dialogSubTitle: 'Are you sure you want to logout?',
      successText: 'Logout',
      success: () async {
        await userConfig.userLogOut();
        navigationService.pop();
        if (userConfig.loggedIn) {
          navigationService.pushDialog(
            const TalawaErrorDialog(
              'Unable to logout, please try again.',
              key: Key('TalawaError'),
              messageType: MessageType.error,
            ),
          );
        } else {
          navigationService.removeAllAndPush(
            '/selectLang',
            '/',
            arguments: '0',
          );
        }
      },
    );
  }

  /// This widget returns the button for social media sharing option.
  ///
  /// **params**:
  /// * `icon`: This is Widget type with icon details.
  /// * `onTap`: This is Function which invoke on tap.
  ///
  /// **returns**:
  /// * `Widget`: Icon Button
  Widget iconButton(Widget icon, void Function() onTap) {
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
  /// **params**:
  /// * `amount`: donation Amount.
  /// * `context`: BuildContext.
  /// * `setter`: `Function` type, which on tap set the amount to `donationAmount`.
  ///
  /// **returns**:
  /// * `Widget`: Icon Button
  Widget dominationButton(
    String amount,
    BuildContext context,
    void Function(void Function()) setter,
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

  /// This widget returns button for domination.
  ///
  /// **params**:
  /// * `setter`: SetState holder.
  ///
  /// **returns**:
  ///   None
  void attachListener(void Function(void Function()) setter) {
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

  /// pop the route from `navigationService`.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void popBottomSheet() {
    _navigationService.pop();
  }

  /// to update the bottom sheet height.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void updateSheetHeight() {
    bottomSheetHeight = SizeConfig.screenHeight! * 0.65;
    notifyListeners();
  }

  /// show message on Snack Bar.
  ///
  /// **params**:
  /// * `message`: String Message to show on snackbar
  ///
  /// **returns**:
  ///   None
  void showSnackBar(String message) {
    _navigationService.showTalawaErrorDialog(message, MessageType.error);
  }
}

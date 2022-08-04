import 'package:currency_picker/currency_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:social_share/social_share.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/custom_painters/telegram_logo.dart';
import 'package:talawa/custom_painters/whatsapp_logo.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

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

  initialize() {
    setState(ViewState.busy);
    currentOrg = _userConfig.currentOrg;
    currentUser = _userConfig.currentUser;
    setState(ViewState.idle);
  }

  Future<void> logout(BuildContext context) async {
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
                Firebase.app()
                    .delete(); // Deleting app will stop all Firebase plugins
                organisation.clear();
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

  changeCurrency(BuildContext context, Function setter) {
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

  invite(BuildContext context) {
    _appLanguageService.initialize();
    final String url =
        'https://cyberwake.github.io/applink/invite?selectLang=${_appLanguageService.appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}';
    final String qrData =
        '${GraphqlConfig.orgURI}?orgid=${userConfig.currentOrg.id!}';
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
                QrImage(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                  foregroundColor: Colors.black,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    iconButton(
                      const FaIcon(
                        FontAwesomeIcons.twitter,
                        size: 35,
                        color: Color(0xFF1DA1F2),
                      ),
                      () async => SocialShare.shareTwitter('Join us', url: url),
                    ),
                    iconButton(
                      CustomPaint(
                        size: Size(
                          50,
                          (50 * 1.004).toDouble(),
                        ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: WhatsappLogo(),
                      ),
                      () async => SocialShare.shareWhatsapp(url),
                    ),
                    iconButton(
                      CustomPaint(
                        size: Size(
                          45,
                          (45 * 1).toDouble(),
                        ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: TelegramLogo(),
                      ),
                      () async => SocialShare.shareTelegram(url),
                    ),
                    iconButton(
                      const FaIcon(
                        FontAwesomeIcons.shareAlt,
                        size: 30,
                        color: Color(0xff40c351),
                      ),
                      () async => SocialShare.shareOptions(url),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  attachListener(Function setter) {
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

  popBottomSheet() {
    _navigationService.pop();
  }

  updateSheetHeight() {
    bottomSheetHeight = SizeConfig.screenHeight! * 0.65;
    notifyListeners();
  }

  showSnackBar(String message) {
    _navigationService.showSnackBar(message);
  }
}

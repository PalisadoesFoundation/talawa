import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:social_share/social_share.dart';
import 'package:talawa/custom_painters/telegram_logo.dart';
import 'package:talawa/custom_painters/whatsapp_logo.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

class ProfilePageViewModel extends BaseModel {
  // Services
  final _userConfig = locator<UserConfig>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late final Box<User> user;
  late final Box<dynamic> url;
  late final Box<OrgInfo> organisation;
  late OrgInfo currentOrg;
  late User currentUser;

  initialize() {
    setState(ViewState.busy);
    currentOrg = _userConfig.currentOrg;
    currentUser = _userConfig.currentUser;
    setState(ViewState.idle);
  }

  Future<void> logout(BuildContext context) async {
    navigationService.pushDialog(CustomAlertDialog(
      reverse: true,
      dialogSubTitle: 'Are you sure you want to logout?',
      successText: 'Logout',
      success: () {
        navigationService.pop();
        navigationService.pushDialog(const CustomProgressDialog(
          key: Key('LogoutProgress'),
        ));
        Future.delayed(const Duration(seconds: 1)).then((value) {
          user = Hive.box<User>('currentUser');
          url = Hive.box('url');
          organisation = Hive.box<OrgInfo>('currentOrg');
          user.clear();
          url.clear();
          organisation.clear();
          navigationService.removeAllAndPush('/selectLang', '/',
              arguments: '0');
        });
      },
    ));
  }

  Widget iconButton(Widget icon, Function onTap) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {
              print('tapped');
              onTap();
            },
            icon: icon),
      ],
    );
  }

  Widget invite(BuildContext context) {
    final String url =
        'https://cyberwake.github.io/applink/invite?selectLang=${AppLanguage().appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${currentOrg.id!}';
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QrImage(
          data: '${GraphqlConfig.orgURI}?orgid=${_userConfig.currentOrg.id!}',
          version: QrVersions.auto,
          size: 200.0,
          foregroundColor: Theme.of(context).textTheme.headline5!.color,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.08,
        ),
        Text('Scan the QR to join ${_userConfig.currentOrg.name}'),
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
                () async => SocialShare.shareTwitter('Join us', url: url)),
            iconButton(
                CustomPaint(
                  size: Size(
                      45,
                      (45 * 1.004)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: WhatsappLogo(),
                ),
                () async => SocialShare.shareWhatsapp(url)),
            iconButton(
                CustomPaint(
                  size: Size(
                      45,
                      (45 * 1)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: TelegramLogo(),
                ),
                () async => SocialShare.shareTelegram(url)),
            iconButton(
                const FaIcon(
                  FontAwesomeIcons.shareAlt,
                  size: 30,
                  color: Color(0xff40c351),
                ),
                () async => SocialShare.shareOptions(url)),
          ],
        )
      ],
    );
  }

  Widget donate() {
    return Container();
  }

  void modalBottomSheet(BuildContext context, ModalSheet sheetType) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child:
                  sheetType == ModalSheet.invite ? invite(context) : donate(),
            ),
          );
        });
  }
}

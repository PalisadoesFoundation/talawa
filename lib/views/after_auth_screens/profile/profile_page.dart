import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:social_share/social_share.dart';
import 'package:talawa/custom_painters/telegram_logo.dart';
import 'package:talawa/custom_painters/whatsapp_logo.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.drawerKey}) : super(key: key);
  final GlobalKey<ScaffoldState>? drawerKey;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilePageViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return Scaffold(
            key: model.scaffoldKey,
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => widget.drawerKey!.currentState!.openDrawer(),
              ),
              key: const Key("ProfilePageAppBar"),
              title: Text(
                AppLocalizations.of(context)!.strictTranslate('Profile'),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              ),
            ),
            body: model.isBusy
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.01,
                        ),
                        CustomListTile(
                            key: const Key('OptionEditProfile'),
                            index: 0,
                            type: TileType.option,
                            option: Options(
                                icon: CustomAvatar(
                                  isImageNull: model.currentUser.image == null,
                                  firstAlphabet: model.currentUser.firstName!
                                      .substring(0, 1),
                                  imageUrl: model.currentUser.image,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .fontSize,
                                ),
                                title:
                                    '${model.currentUser.firstName!} ${model.currentUser.lastName!}',
                                subtitle: model.currentUser.email!,
                                trailingIconButton: IconButton(
                                  icon: Icon(
                                    Icons.drive_file_rename_outline,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () {
                                    navigationService
                                        .pushScreen("/editProfilePage");
                                  },
                                )),
                            onTapOption: () {}),
                        const Divider(),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.63,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomListTile(
                                  key: const Key('Option0'),
                                  index: 0,
                                  type: TileType.option,
                                  option: Options(
                                    icon: const Icon(
                                      Icons.phonelink_setup,
                                      size: 30,
                                    ),
                                    title: AppLocalizations.of(context)!
                                        .strictTranslate('App Settings'),
                                    subtitle:
                                        '${AppLocalizations.of(context)!.strictTranslate("Language")}, ${AppLocalizations.of(context)!.strictTranslate("dark mode")}, ${AppLocalizations.of(context)!.strictTranslate("font size")}',
                                  ),
                                  onTapOption: () {}),
                              CustomListTile(
                                  key: const Key('Option1'),
                                  index: 1,
                                  type: TileType.option,
                                  option: Options(
                                    icon: const Icon(
                                      Icons.help_outline,
                                      size: 30,
                                    ),
                                    title: AppLocalizations.of(context)!
                                        .strictTranslate('Help'),
                                    subtitle: AppLocalizations.of(context)!
                                        .strictTranslate(
                                            'Reach out to us for help'),
                                  ),
                                  onTapOption: () {}),
                              CustomListTile(
                                  key: const Key('Option2'),
                                  index: 2,
                                  type: TileType.option,
                                  option: Options(
                                    icon: Icon(
                                      Icons.monetization_on,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 30,
                                    ),
                                    title: AppLocalizations.of(context)!
                                        .strictTranslate('Donate Us'),
                                    subtitle: AppLocalizations.of(context)!
                                        .strictTranslate(
                                            'Help us to develop for you'),
                                  ),
                                  onTapOption: () =>
                                      modalBottomSheet(context, donate())),
                              CustomListTile(
                                  key: const Key('Option3'),
                                  index: 3,
                                  type: TileType.option,
                                  option: Options(
                                    icon: Icon(
                                      Icons.share,
                                      color: Theme.of(context).accentColor,
                                      size: 30,
                                    ),
                                    title: AppLocalizations.of(context)!
                                        .strictTranslate('Invite'),
                                    subtitle: AppLocalizations.of(context)!
                                        .strictTranslate('Invite to org'),
                                  ),
                                  onTapOption: () => modalBottomSheet(
                                      context, invite(context))),
                              CustomListTile(
                                  key: const Key('Option4'),
                                  index: 3,
                                  type: TileType.option,
                                  option: Options(
                                    icon: Icon(
                                      Icons.logout,
                                      color: Theme.of(context).accentColor,
                                      size: 30,
                                    ),
                                    title: AppLocalizations.of(context)!
                                        .strictTranslate('Log out'),
                                    subtitle: AppLocalizations.of(context)!
                                        .strictTranslate('Log out from Talawa'),
                                  ),
                                  onTapOption: () => model.logout(context)),
                              const FromPalisadoes(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
        });
  }

  Widget invite(BuildContext context) {
    final String url =
        'https://cyberwake.github.io/applink/invite?selectLang=${AppLanguage().appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}';
    final String qrData =
        '${GraphqlConfig.orgURI}?orgid=${userConfig.currentOrg.id!}';
    print(url);
    print(qrData);
    return Column(
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
                () async => SocialShare.shareTwitter('Join us', url: url)),
            iconButton(
                CustomPaint(
                  size: Size(
                      50,
                      (50 * 1.004)
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

  void modalBottomSheet(BuildContext context, Widget child) {
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: child,
            ),
          );
        });
  }

  Widget donate() {
    return Container();
  }
}

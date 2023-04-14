// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:social_share/social_share.dart';
import 'package:talawa/custom_painters/telegram_logo.dart';
import 'package:talawa/custom_painters/whatsapp_logo.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/lang_view_model.dart';

/// Creating an instance of AppLangauge() to set up localized values for each locale that our app supports.
final _appLanguageService = locator<AppLanguage>();

/// This widget gives us various options to invite someone to an organization.
/// We can use QR code scanner, social media platforms like twitter, whatsapp, telegram and many more.
Widget invite(BuildContext context) {
  _appLanguageService.initialize();

  final String url =
      'https://cyberwake.github.io/applink/invite?selectLang=${_appLanguageService.appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}';
  final String qrData =
      '${GraphqlConfig.orgURI}?orgid=${userConfig.currentOrg.id!}';

  // print(url);
  // print(qrData);

  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //Scan the below given QR code to join the organization.
      QrImage(
        key: const Key("QRcode"),
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
      //Tap on the Twitter icon to join the organization through Twitter.
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          iconButton(
            "Twitter",
            const FaIcon(
              FontAwesomeIcons.twitter,
              size: 35,
              color: Color(0xFF1DA1F2),
            ),
            () async => SocialShare.shareTwitter('Join us', url: url),
          ),
          //Tap on the Whatsapp icon to join the organization through Whatsapp.
          iconButton(
            "WhatsApp",
            CustomPaint(
              size: const Size(
                50,
                50 * 1.004,
              ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: WhatsappLogo(),
            ),
            () async => SocialShare.shareWhatsapp(url),
          ),
          iconButton(
            "Telegram",
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
            "Alt",
            const FaIcon(
              FontAwesomeIcons.shareNodes,
              size: 30,
              color: Color(0xff40c351),
            ),
            () async => SocialShare.shareOptions(url),
          ),
        ],
      )
    ],
  );
}

/// This function is for debugging purposes.
/// It prints "tapped" in the console for the developer to know that the button was tapped.
Widget iconButton(String key, Widget icon, Function onTap) {
  return Stack(
    children: [
      IconButton(
        key: Key(key),
        onPressed: () {
          print('tapped');
          onTap();
        },
        icon: icon,
      ),
    ],
  );
}

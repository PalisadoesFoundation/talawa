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
                size: const Size(
                    50,
                    50 *
                        1.004), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
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

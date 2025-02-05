


# invite function










[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) invite
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)





<p>This widget gives us various options to invite someone to an organization.
We can use QR code scanner, social media platforms like twitter, whatsapp, telegram and many more.</p>



## Implementation

```dart
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
```








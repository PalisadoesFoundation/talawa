


# invite method








void invite
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)





<p>This function generates the organization invitation link in a Dialog Box.
Dialog box contains the QR-code of organization invite link and social media sharing options.</p>



## Implementation

```dart
void invite(BuildContext context) {
  _appLanguageService.initialize();
  // organization url
  final String url =
      'https://cyberwake.github.io/applink/invite?selectLang=${_appLanguageService.appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}';
  // QR
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
                      size: const Size(
                        50,
                        50 * 1.004,
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
                      FontAwesomeIcons.shareNodes,
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
```








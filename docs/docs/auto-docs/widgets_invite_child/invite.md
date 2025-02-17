::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_invite_child/widgets_invite_child-library-sidebar.html" below-sidebar=""}
<div>

# [invite]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[invite]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#invite-param-context .parameter}

)
:::

::: {.section .desc .markdown}
We can use QR code scanner, social media platforms like twitter,
whatsapp, telegram and many more..

more_info_if_required

**params**:

-   `context`: Build Context

**returns**:

-   `Widget`: Returns Column with QR Code
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget invite(BuildContext context) {
  _appLanguageService.initialize();

  // final String url =
  //     'https://cyberwake.github.io/applink/invite?selectLang=${_appLanguageService.appLocal.languageCode}&setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}';
  const String qrData =
      'https://github.com/PalisadoesFoundation/talawa/releases/download/automated/app-release.apk';

  // print(url);
  // print(qrData);

  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //Scan the below given QR code to join the organization.
      QrImageView(
        key: const Key("QRcode"),
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
      //Tap on the Twitter icon to join the organization through Twitter.
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     iconButton(
      //       "Twitter",
      //       const FaIcon(
      //         FontAwesomeIcons.twitter,
      //         size: 35,
      //         color: Color(0xFF1DA1F2),
      //       ),
      //       () async => SocialShare.shareTwitter('Join us', url: url),
      //     ),
      //     //Tap on the Whatsapp icon to join the organization through Whatsapp.
      //     iconButton(
      //       "WhatsApp",
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
      //       "Telegram",
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
      //       "Alt",
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
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [invite_child](../widgets_invite_child/)
3.  invite function

##### invite_child library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::

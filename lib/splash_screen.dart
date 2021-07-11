import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Uri? _initialUri;
  Uri? _latestUri;
  late StreamSubscription _sub;

  Future<void> _handleInitialUri() async {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      setState(() {
        _latestUri = uri;
      });
    }, onError: (Object err) {
      if (!mounted) return;
      setState(() {
        _latestUri = null;
      });
    });
    try {
      final uri = await getInitialUri();
      if (!mounted) return;
      setState(() => _initialUri = uri);
    } on PlatformException {
      if (!mounted) return;
      setState(() => _initialUri = null);
    } on FormatException catch (err) {
      debugPrint(err.toString());
      if (!mounted) return;
      setState(() => _initialUri = null);
    }
    final bool userLoggedIn = await userConfig.userLoggedIn();
    if (_latestUri == null && _initialUri == null) {
      Future.delayed(const Duration(milliseconds: 750)).then((value) async {
        if (userLoggedIn) {
          if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
            if (userConfig.currentUser.membershipRequests!.isEmpty) {
              navigationService.pushReplacementScreen(Routes.joinOrg,
                  arguments: '-1');
            } else {
              navigationService.pushReplacementScreen(Routes.waitingScreen,
                  arguments: '0');
            }
          } else {
            navigationService.pushReplacementScreen(Routes.mainScreen,
                arguments: '0');
          }
        } else {
          navigationService.pushReplacementScreen(Routes.languageSelectionRoute,
              arguments: 'en');
        }
      });
    } else {
      if (_initialUri != null) {
        if (_initialUri!.pathSegments[1] == 'invite') {
          if (!userLoggedIn) {
            navigationService.fromInviteLink(
                _initialUri!.queryParameters.keys.toList(growable: false),
                _initialUri!.queryParameters.values.toList(growable: false));
          } else if (_initialUri!.queryParameters.values
                  .toList(growable: false)[1]
                  .compareTo(GraphqlConfig.orgURI!) ==
              0) {
            if (_initialUri!.queryParameters.keys.last.compareTo('selectOrg') ==
                0) {
              print('here');
              final List<String> routeNames = [
                Routes.mainScreen.split('/').last,
                Routes.joinOrg.split('/').last
              ];
              final List<dynamic> arguments = [
                '0',
                _initialUri!.queryParameters.values.last
              ];
              print(routeNames);
              print(arguments);
              navigationService.fromInviteLink(routeNames, arguments);
            } else {
              navigationService.showSnackBar('Invalid url');
            }
          } else {
            navigationService.showSnackBar(
                'Organisation on different server!. Logout and open link again');
          }
        }
      }
    }
  }

  @override
  void initState() {
    _handleInitialUri();
    super.initState();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      key: const Key('SplashScreenScaffold'),
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              key: const Key('LogoPainter'),
              size: Size(SizeConfig.screenWidth! * 0.6,
                  (SizeConfig.screenWidth! * 0.6).toDouble()),
              painter: AppLogo(),
            ),
          ),
          Positioned(
              top: SizeConfig.screenHeight! / 1.5,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TALAWA',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )),
          Positioned(
              top: SizeConfig.screenHeight! / 1.08,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.strictTranslate('from'),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )),
          Positioned(
              top: SizeConfig.screenHeight! / 1.05,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PALISADOES',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

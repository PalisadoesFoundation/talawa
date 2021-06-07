import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
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
      print('got uri: $uri');
      setState(() {
        _latestUri = uri;
      });
    }, onError: (Object err) {
      if (!mounted) return;
      print('got err: $err');
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
      print('failed to get initial uri');
    } on FormatException catch (err) {
      if (!mounted) return;
      setState(() => _initialUri = null);
      print('malformed initial uri error: $err');
    }
    if (_latestUri == null && _initialUri == null) {
      Future.delayed(const Duration(milliseconds: 100)).then((value) async {
        final bool userLoggedIn = await locator<UserConfig>().userLoggedIn();
        if (userLoggedIn) {
          if (locator<UserConfig>().currentUser!.joinedOrganizations!.isEmpty) {
            locator<NavigationService>()
                .pushReplacementScreen('/waiting', arguments: '0');
          } else {
            locator<NavigationService>()
                .pushReplacementScreen('/mainScreen', arguments: '0');
          }
        } else {
          locator<NavigationService>()
              .pushReplacementScreen('/selectLang', arguments: '0');
        }
      });
    } else {
      if (_initialUri != null) {
        print('initial: $_initialUri');
        print('latest: $_latestUri');
        if (_initialUri!.pathSegments[1] == 'invite') {
          locator<NavigationService>().fromInviteLink(
              _initialUri!.queryParameters.keys.toList(growable: false),
              _initialUri!.queryParameters.values.toList(growable: false));
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
    locator<SizeConfig>().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
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
                    'from',
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required Key key, this.mainScreenIndex = 0})
      : super(key: key);
  final int mainScreenIndex;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Uri? _initialUri;
  Uri? _latestUri;
  late StreamSubscription _sub;

  Future<void> _handleInitialUri() async {
    _sub = uriLinkStream.listen(
      (Uri? uri) {
        if (!mounted) return;
        setState(() {
          _latestUri = uri;
        });
      },
      onError: (Object err) {
        if (!mounted) return;
        setState(() {
          _latestUri = null;
        });
      },
    );
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
      _handleUserLogIn(userLoggedIn);
      return;
    }

    if (_initialUri != null) {
      await _handleDeepLinks(userLoggedIn);
    }
  }

  Future<void> _handleDeepLinks(bool userLoggedIn) async {
    final keys = _initialUri!.queryParameters.keys;
    final values = _initialUri!.queryParameters.values;

    final fromInviteLink = navigationService.fromInviteLink;
    final showSnackBar = navigationService.showSnackBar;
    final pushReplacementScreen = navigationService.pushReplacementScreen;

    final orgURI = GraphqlConfig.orgURI!;
    final mainScreenArgs =
        MainScreenArgs(mainScreenIndex: widget.mainScreenIndex);

    if (_initialUri!.pathSegments[1] == 'invite') {
      if (!userLoggedIn) {
        fromInviteLink(
            keys.toList(growable: false), values.toList(growable: false));
        return;
      }

      final setUrl = values.toList(growable: false)[1];
      if (setUrl.compareTo(orgURI) != 0) {
        showSnackBar(
          'Organisation on different server! Logout and open link again',
        );
        return;
      }

      if (keys.last.compareTo('selectOrg') != 0) {
        showSnackBar('Invalid url');
        return;
      }

      final routeNames = [
        Routes.mainScreen.split('/').last,
        Routes.joinOrg.split('/').last
      ];
      final arguments = [
        mainScreenArgs,
        values.last,
      ];
      fromInviteLink(routeNames, arguments);
      return;
    }
    if (_initialUri!.pathSegments[1] == 'eventInvite') {
      if (!userLoggedIn) {
        pushReplacementScreen(
          Routes.languageSelectionRoute,
          arguments: 'en',
        );
        return;
      }

      final setUrl = values.toList(growable: false)[0];
      if (setUrl.compareTo(orgURI) != 0) {
        Clipboard.setData(ClipboardData(text: setUrl));
        showSnackBar(
          'Organisation on different server! Url copied to clipboard.',
        );
        pushReplacementScreen(
          Routes.mainScreen,
          arguments: mainScreenArgs,
        );
        return;
      }

      final currentOrgId = userConfig.currentOrg.id!;
      if (values.toList()[1].compareTo(currentOrgId) != 0) {
        pushReplacementScreen(Routes.joinOrg, arguments: values.toList()[1]);
        return;
      }

      final routeNames = [
        Routes.mainScreen.split('/').last,
        Routes.eventInfoPage.split('/').last
      ];

      final model = locator<ExploreEventsViewModel>();
      await model.initialise();

      await Future.delayed(Duration.zero);
      Event? event;
      for (final ele in model.events) {
        if (ele.id == values.last) event = ele;
      }

      if (event == null) {
        showSnackBar('Event not found');
        pushReplacementScreen(
          Routes.mainScreen,
          arguments: mainScreenArgs,
        );
        return;
      }

      final arguments = [
        MainScreenArgs(mainScreenIndex: 1),
        {
          "event": event,
          "exploreEventViewModel": model,
        },
      ];

      fromInviteLink(routeNames, arguments);
      return;
    }
  }

  void _handleUserLogIn(bool userLoggedIn) {
    Future.delayed(const Duration(milliseconds: 750)).then((value) async {
      final pushReplacementScreen = navigationService.pushReplacementScreen;
      if (!userLoggedIn) {
        pushReplacementScreen(Routes.languageSelectionRoute, arguments: 'en');
        return;
      }

      final currentUser = userConfig.currentUser;
      if (currentUser.joinedOrganizations!.isNotEmpty) {
        final mainScreenArgs = MainScreenArgs(
            mainScreenIndex: widget.mainScreenIndex, fromSignUp: false);
        pushReplacementScreen(Routes.mainScreen, arguments: mainScreenArgs);
        return;
      }

      if (currentUser.membershipRequests!.isNotEmpty) {
        pushReplacementScreen(Routes.waitingScreen, arguments: '0');
        return;
      }

      pushReplacementScreen(Routes.joinOrg, arguments: '-1');
    });
  }

  @override
  void initState() {
    super.initState();
    _handleInitialUri();
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
              size: Size(
                SizeConfig.screenWidth! * 0.6,
                (SizeConfig.screenWidth! * 0.6).toDouble(),
              ),
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
            ),
          ),
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
            ),
          ),
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
            ),
          )
        ],
      ),
    );
  }
}
